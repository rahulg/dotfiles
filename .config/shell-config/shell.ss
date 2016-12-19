; shell-config
;
; Unified shell environment configuration script
; Place your shell configuration in config.ss

(use-modules (ice-9 popen)
             (ice-9 rdelim)
             (ice-9 regex)
             (ice-9 ftw))

(define (print s)
  (display s)
  (newline))

(define (run . argv)
  (string-trim-both (let* ((port (open-input-pipe (string-join argv " ")))
                           (str (read-string port)))
                      (close-pipe port)
                      str)))

(define (expand-path path)
  (run "echo" path))

(define (absolute-path path)
  (let* ((sep file-name-separator-string)
         (pwd (getcwd))
         (full (expand-path path))
         (_ (chdir (dirname full)))
         (dir (getcwd)))
    (chdir pwd)
    (string-append dir
                   (if (string=? (string-take-right dir (string-length sep)) sep)
                       ""
                       sep)
                   (basename full))))

(define (env name)
  (getenv (symbol->string name)))

(define home
  (env 'HOME))

(define (surround value token)
  (string-append token value token))

(define (squote value)
  (surround value "'"))

(define (dquote value)
  (surround value "\""))

(define (is-quoted? val)
  (if (> (string-length val) 0)
      (member (string-take val 1) '("'" "\""))
      #f))

(define (auto-quote val)
  (if (is-quoted? val)
      val
      (dquote val)))

(define (varl name val)
  (setenv (symbol->string name) val)
  (set #f name (auto-quote val)))

(define (var name val)
  (setenv (symbol->string name) val)
  (set #t name (auto-quote val)))

(define (source path)
  (print (string-append "source " (auto-quote path))))

(define (source-if-exists path)
  (if (file-exists? (absolute-path path))
      (source path)))

(define (for-file-in-tree path f)
  (ftw (absolute-path path) (lambda (name stat flag)
                              (if (eq? flag 'regular) (f name stat))
                              #t)))

(define shell
  (let ((sh (if (> (length (command-line)) 1)
                (list-ref (command-line) 1)
                (basename (getenv "SHELL")))))
    (cond
      [(string=? sh "fish")
       'fish]
      [(member sh '("posix" "sh" "bash" "ash" "dash" "ksh" "zsh"))
       'posix])))

(define os
  (string->symbol (string-downcase (utsname:sysname (uname)))))

(cond
  [(eq? shell 'fish) (load "fish.ss")]
  [(eq? shell 'posix) (load "posix.ss")])

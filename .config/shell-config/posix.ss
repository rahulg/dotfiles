; shell-config posix sh support

(define (set export? name val)
  (print (string-append (if export?
                            (string-append "export ")
                            "")
                        (symbol->string name) "=" val)))

(define (array . vals)
  (string-join vals ":"))

(define (array-var name . vals)
  (var name (dquote (apply array vals))))

(define (prefix name . vals)
  (apply array-var name (append vals 
                                (list (string-append "$" (symbol->string name))))))

(define (suffix name . vals)
  (apply array-var name (append (list (string-append "$" (symbol->string name)))
                                vals)))

(define (alias name val)
  (print (string-append "alias " (symbol->string name) "=" (squote val))))

(define abbr alias)

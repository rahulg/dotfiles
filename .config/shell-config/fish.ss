; shell-config fish support

(define (set export? name val)
  (print (string-append "set" (if export? 
								(string-append " -x ")
								" ")
						(symbol->string name) " " val)))

(define (raw-array . vals)
  (string-join vals " "))

(define (array . vals)
  (apply raw-array (map auto-quote vals)))

(define (array-var name . vals)
  (set #t name (apply raw-array vals)))

(define (prefix name . vals)
  (apply array-var name (append (map auto-quote vals)
								(list (string-append "$" (symbol->string name))))))

(define (suffix name . vals)
  (apply array-var name (append (list (string-append "$" (symbol->string name)))
								(map auto-quote vals))))

(define (alias name val)
  (print (string-append "alias " (symbol->string name) " " (auto-quote val))))

(define (abbr name val)
  (print (string-append "abbr " (symbol->string name) " " (auto-quote val))))

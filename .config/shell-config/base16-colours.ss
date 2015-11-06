(use-modules (ice-9 format))

(define colour00 "18/18/18") ; base 00
(define colour01 "ab/46/42") ; base 08
(define colour02 "a1/b5/6c") ; base 0b
(define colour03 "f7/ca/88") ; base 0a
(define colour04 "7c/af/c2") ; base 0d
(define colour05 "ba/8b/af") ; base 0e
(define colour06 "86/c1/b9") ; base 0c
(define colour07 "d8/d8/d8") ; base 05
(define colour08 "58/58/58") ; base 03
(define colour09 colour01)
(define colour10 colour02)
(define colour11 colour03)
(define colour12 colour04)
(define colour13 colour05)
(define colour14 colour06)
(define colour15 "f8/f8/f8") ; base 07
(define colour16 "dc/96/56") ; base 09
(define colour17 "a1/69/46") ; base 0f
(define colour18 "28/28/28") ; base 01
(define colour19 "38/38/38") ; base 02
(define colour20 "b8/b8/b8") ; base 04
(define colour21 "e8/e8/e8") ; base 06
(define colour_fg "d8/d8/d8") ; base 05
(define colour_bg "18/18/18") ; base 00
(define colour_cursor "d8/d8/d8") ; base 05

(define (termcodes tmux screen general)
  (cond
	[(getenv "TMUX")
	 tmux]
	[(string=? (string-take (getenv "TERM") 6) "screen")
	 screen]
	[else
	  general]))

(define (templ) (termcodes
				  "\x1bPtmux;\x1b\x1b]4;~d;rgb:~a\x07\x1b\\"
				  "\x1bP\x1b]4;~d;rgb:~a\x07\x1b\\"
				  "\x1b]4;~d;rgb:~a\x1b\\"))

(define (templ-var) (termcodes
					  "\x1bPtmux;\x1b\x1b]~d;rgb:~a\x07\x1b\\"
					  "\x1bP\x1b]~d;rgb:~a\x07\x1b\\"
					  "\x1b]~d;rgb:~a\x1b\\"))

(map (lambda (n) (format #t (templ) n (eval-string (format #f "colour~2,'0d" n))))
	 '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21))

(format #t (templ-var) 10 colour_fg)
(format #t (templ-var) 11 colour_bg)
(format #t (templ-var) 12 colour_cursor)

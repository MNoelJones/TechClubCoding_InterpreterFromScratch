(import argparse)
(import string)

(defn parse_args [&optional arg]
	(setv parser (argparse.ArgumentParser))
	(parser.add_argument "program" :nargs "*")
	(parser.parse_args arg)
)

(defn strip_ws [unstripped &optional stripped]
	(if (is stripped None) (setv stripped []))
	(setv unstripped (list unstripped))
	(if (= (len unstripped) 0)
		stripped
		(do 
			(if (not (in (get unstripped 0) string.whitespace))
				(stripped.append (get unstripped 0))
			)
			(strip_ws (list (rest unstripped)) stripped)
		)
	)
)

(defn preprocess [program]
	(print program)
	(.join "" (strip_ws (.lower program)))
)

(defn main []
	(setv args (parse_args))
	(print (preprocess (.join " " args.program)))
)

(main)
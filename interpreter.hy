(import argparse)
(import string)

(defn parse_args [&optional arg]
	(setv parser (argparse.ArgumentParser))
	(parser.add_argument "program" :nargs "*")
	(parser.parse_args arg)
)

(defn _strip_ws [unstripped &optional stripped]
	(if (is stripped None) (setv stripped []))
	(setv unstripped (list unstripped))
	(if (= (len unstripped) 0)
		stripped
		(do 
			(if (not (in (get unstripped 0) string.whitespace))
				(stripped.append (get unstripped 0))
			)
			(_strip_ws (list (rest unstripped)) stripped)
		)
	)
)

(defn strip_ws [unstripped]
	(.join "" (_strip_ws (list unstripped)))
)

(defn preprocess [program]
	(print program)
	(strip_ws (.lower program))
)

(defn interpreter [program]
	(preprocess program)
)

(defn main []
	(setv args (parse_args))
	(print (interpreter (.join " " args.program)))
)

(main)
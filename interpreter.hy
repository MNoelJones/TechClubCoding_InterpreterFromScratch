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
			(if (not (in (first unstripped) string.whitespace))
				(stripped.append (first unstripped))
			)
			(_strip_ws (list (rest unstripped)) stripped)
		)
	)
)

(defn strip_ws [unstripped]
	(.join "" (_strip_ws (list unstripped)))
)

(defn split_at [strg line]
	(if (in strg line) 
		[
			(cut line 0 (.find line strg))
			(cut line (+ (.find line strg) 2) (len line))
		]
		[line None]
	)
)

(defn get_line_n_comment [line]
	(split_at "//" line)
)

(defn strip_comment [line]
	(first (get_line_n_comment line))
)

(defn strip_comments [program]
	(.join "" (lfor line (.split program "\n") (strip_comment line)))
)

(defclass InvalidCharacter [BaseException]
	None
)

(defn valid_progchar? [char]
	(in char "abcdefghijklmnopqrstuvwxyz")
)

(defn preprocess [program]
	(print program)
	(setv pp_program (strip_ws (.lower (strip_comments program))))
	(if (not (every? valid_progchar? pp_program))
		(raise (InvalidCharacter))
		pp_program
	)
)

(defn interpreter [program]
	(preprocess program)
)

(defn main []
	(setv args (parse_args))
	(print (interpreter (.join " " args.program)))
)

(if (= __name__ "__main__")
	(main)
)
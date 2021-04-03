(import argparse)
(import string)

#_(Exception classes)
(defclass InvalidCharacter [BaseException]
	None
)

(defclass InvalidCommand [BaseException]
	None
)

(defn parse_args [&optional arg]
	(setv parser (argparse.ArgumentParser))
	(parser.add_argument "program" :nargs "*")
	(parser.parse_args arg)
)

#_(Utility functions)
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
			(cut line (+ (.find line strg) (len strg)) (len line))
		]
		[line None]
	)
)

(defn strip_quotes [line]
	(if 
		(.startswith line "\"")
			(strip_quotes (cut line 1 (len line)))
		(.endswith line "\"")
			(strip_quotes (cut line 0 (- (len line) 1)))
		True
			line
	)
)

#_(Parsing functions)
(defn get_line_n_comment [line]
	(split_at "//" line)
)

(defn strip_comment [line]
	(first (get_line_n_comment line))
)

(defn strip_comments [program]
	(.join "" (lfor line (.split program "\n") (strip_comment line)))
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

(defn _interpreter [&optional program file]
	(if (none? file)
		(preprocess program)
		(with [f (open file)] (preprocess (.read f)))
	)
)

(defn interpreter [command]
	(setv cmd_arg (split_at " " command))
	(cond [(= (first cmd_arg) "run")
			(_interpreter (strip_quotes (second cmd_arg)))]
		  [(= (first cmd_arg) "file")
			(_interpreter :file (second cmd_arg))]
		  [True (raise (InvalidCommand))]
	)
)

(defn main []
	(setv args (parse_args))
	(print (interpreter (.join " " args.program)))
)

(if (= __name__ "__main__")
	(main)
)
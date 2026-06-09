utility
corners

	| hw hh cos sin |
	hw := self width / 2.0.
	hh := self height / 2.0.
	cos := self rotation cos.
	sin := self rotation sin.
	
	^ Array
		with: self center + (cos * hw - (sin * hh) @ (sin * hw + (cos * hh)))
		with: self center + (cos * hw negated - (sin * hh) @ (sin * hw negated + (cos * hh)))
		with: self center + (cos * hw negated - (sin * hh negated) @ (sin * hw negated + (cos * hh negated)))
		with: self center + (cos * hw - (sin * hh negated) @ (sin * hw + (cos * hh negated)))
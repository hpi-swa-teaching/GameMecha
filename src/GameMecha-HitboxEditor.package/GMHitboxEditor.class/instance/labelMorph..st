as yet unclassified
labelMorph: text

	| s |
	s := StringMorph new.
	s
		contents: text;
		color: self textColor.
	^ s
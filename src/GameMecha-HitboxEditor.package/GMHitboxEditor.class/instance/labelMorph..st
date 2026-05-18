as yet unclassified
labelMorph: text

	| s |
	s := StringMorph new.
	s
		contents: text;
		color: Color gray.
	^ s
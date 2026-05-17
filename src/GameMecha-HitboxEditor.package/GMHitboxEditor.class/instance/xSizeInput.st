as yet unclassified
xSizeInput

	| textField |
	textField := TextMorph new.
	textField
		contents: 'type here';
		extent: 120 @ 24;
		borderWidth: 1;
		borderColor: Color lightGray;
		color: Color gray.
	" acceptSelector: #myFunction:;
	 acceptTarget: self;"
	^ textField
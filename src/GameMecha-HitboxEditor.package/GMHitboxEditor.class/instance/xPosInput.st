as yet unclassified
xPosInput

	| textField |
	textField := TextMorph new.
	textField
		contents: 'type here';
		extent: 120 @ 24;
		borderWidth: 1;
		borderColor: Color transparent;
		color: self textColor;
		backgroundColor: self textFieldColor.
	" acceptSelector: #myFunction:;
	 acceptTarget: self;"
	^ textField
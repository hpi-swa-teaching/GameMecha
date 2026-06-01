accessing
xPosInput

	| textField |
	textField := TextMorph new.
	textField
		contents: 'type here';
		extent: (120px @ 24px);
		borderWidth: 1;
		borderColor: Color transparent;
		color: self textColor;
		backgroundColor: self textFieldColor.
	
	^ textField
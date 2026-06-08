ui-elements
createInputField

	| textField |
	textField := TextMorph new.
	textField
		contents: '            ';
		extent: 120 px @ 24 px;
		borderWidth: 1;
		borderColor: Color transparent;
		color: self textColor;
		backgroundColor: self textFieldColor;
		autoFit: false;
		yourself.
	^ textField
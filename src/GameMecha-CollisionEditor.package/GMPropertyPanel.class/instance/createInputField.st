ui-elements
createInputField

	^ TextMorph new
		contents: '';
		borderWidth: 2;
		borderColor: self borderColor;
		color: self textColor;
		backgroundColor: self backgroundColor;
		wrapFlag: true;
		autoFit: false;
		extent: 50 px @ 20 px;
		yourself
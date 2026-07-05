creation
buildScaleInputField

	self scaleTextInputField: (TextMorph new
		contents: '1';
		borderWidth: 2 px;
		borderColor: self buttonBorderColor;
		backgroundColor: self buttonColor;
		color: self textColor;
		wrapFlag: true;
		autoFit: false;
		extent: 40 px @ 20 px).
	^ self scaleTextInputField
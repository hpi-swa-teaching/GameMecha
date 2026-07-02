initialize
initializeScaleInput

	^ self scaleTextInputField ifNil: [
		self scaleTextInputField: TextMorph new.
		self initializeScaleInput
			contents: '1';
			borderWidth: 2 px;
			borderColor: self buttonBorderColor;
			backgroundColor: self buttonColor;
			color: self textColor;
			wrapFlag: true;
			autoFit: false;
			extent: 40 px @ 20 px]
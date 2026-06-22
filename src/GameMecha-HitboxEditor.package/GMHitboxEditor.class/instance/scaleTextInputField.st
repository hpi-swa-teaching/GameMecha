textInput
scaleTextInputField

	^ scaleTextInputField ifNil: [
		scaleTextInputField := TextMorph new.
		self scaleTextInputField
			contents: 'type scale here';
			backgroundColor: Color white;
			wrapFlag: true;
			autoFit: false;
			extent: 150 px @ 20 px]
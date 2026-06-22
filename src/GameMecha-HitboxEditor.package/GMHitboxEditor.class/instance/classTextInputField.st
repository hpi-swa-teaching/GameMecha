textInput
classTextInputField

	^ classTextInputField ifNil: [
		classTextInputField := TextMorph new.
		self classTextInputField
			contents: 'class name';
			backgroundColor: Color white;
			autoFit: false;
			wrapFlag: true;
			extent: 150 px @ 20 px]
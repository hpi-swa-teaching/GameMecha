textInput
classTextInputField

	^classTextInputField ifNil: [ 
		classTextInputField := TextMorph new.
		self classTextInputField 
	    	contents: 'class name';
	    	backgroundColor: Color white;
		wrapFlag: true;
	    	extent: (150px@20px). ]

	
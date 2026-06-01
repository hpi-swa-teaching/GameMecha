textInput
classTextInputField

	^classTextInputField ifNil: [ 
		classTextInputField := TextMorph new.
		self classTextInputField 
	    	contents: 'Type your Classname here :)';
	    	backgroundColor: Color white;
		wrapFlag: true;
	    	extent: (150px@20px). ]

	
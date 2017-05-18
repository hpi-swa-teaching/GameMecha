initializing
keyDown: anEvent
	self keyBoardKeys at: anEvent keyCharacter asciiValue put: true.
	Transcript showln: anEvent keyCharacter asciiValue.
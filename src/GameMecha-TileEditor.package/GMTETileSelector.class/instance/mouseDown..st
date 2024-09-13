input handling
mouseDown: evt

	evt redButtonPressed
		ifTrue: [self model selectTile: self]
		ifFalse: [self model backgroundTile: self]
*GM-Core
gmDeregisterBlockForKey: aCharacter
	self eventHandler class = GMKeyHandler
		ifTrue: [self extension eventHandler gmDeregisterBlockForKey: aCharacter] 
		ifFalse: [self error: 'Morph has no GMKeyHandler'].
	
	
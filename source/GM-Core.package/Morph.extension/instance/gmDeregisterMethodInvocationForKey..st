*GM-Core
gmDeregisterMethodInvocationForKey: aCharacter
	self eventHandler class = GMKeyHandler
		ifTrue: [self extension eventHandler gmDeregisterMethodInvocationForKey: aCharacter] 
		ifFalse: [self error: 'Morph has no GMKeyHandler'].
	
	
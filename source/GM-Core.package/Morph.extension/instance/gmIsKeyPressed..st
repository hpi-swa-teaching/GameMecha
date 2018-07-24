*GM-Core
gmIsKeyPressed: aCharacter
	self eventHandler class = GMKeyHandler ifTrue: [^ self eventHandler gmIsKeyPressed: aCharacter] 
		ifFalse: [self error: 'Morph has no GMKeyHandler'].
	
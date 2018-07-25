*GM-Core
gmRegisterBlock: aBlock forKey: aCharacter
	self eventHandler class = GMKeyHandler 
		ifTrue: [self extension eventHandler gmRegisterBlock: aBlock forKey: aCharacter] 
		ifFalse: [self error: 'Morph has no GMKeyHandler'].
	
	
*GM-Core
gmRegisterMethodInvocation: aSelector on: aReceivingObject forKey: aCharacter
	self eventHandler class = GMKeyHandler 
		ifTrue: [self extension eventHandler gmRegisterMethodInvocation: aSelector 
			on: aReceivingObject forKey: aCharacter] 
		ifFalse: [self error: 'Morph has no GMKeyHandler'].
	
	
as yet unclassified
register: aHandler for: aCharacter at: aHandlerCollection
	| asci |
	asci := aCharacter asUppercase asciiValue.
	(aHandlerCollection includesKey: asci) 
	ifTrue: [ | oldHandlers |
		oldHandlers := aHandlerCollection at: asci.
		aHandlerCollection at: asci put: 	
		[oldHandlers value. 
		aHandler value.]]
	ifFalse: [aHandlerCollection at: asci put: aHandler.].

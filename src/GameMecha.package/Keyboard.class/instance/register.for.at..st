handler registration
register: aHandler for: aCharacter at: aHandlerCollection
	| asciiValue |
	asciiValue := aCharacter asUppercase asciiValue.
	(aHandlerCollection includesKey: asciiValue) 
	ifTrue: [ | oldHandlers |
		oldHandlers := aHandlerCollection at: asciiValue.
		aHandlerCollection at: asciiValue put: 	
		[oldHandlers value. 
		aHandler value]]
	ifFalse: [aHandlerCollection at: asciiValue put: aHandler].

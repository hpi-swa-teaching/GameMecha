handler registration
register: aHandler for: aCharacter at: aHandlerCollection
	| asciiValue |
	asciiValue :=  (self preprocessChar: aCharacter).
	aHandlerCollection
		at: asciiValue
		ifPresent: [:oldHandlers | aHandlerCollection
			at: asciiValue
			put: [oldHandlers value. aHandler value]]
		ifAbsentPut: [aHandler].
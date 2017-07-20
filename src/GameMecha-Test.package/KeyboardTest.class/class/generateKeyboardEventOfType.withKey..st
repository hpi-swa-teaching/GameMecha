as yet unclassified
generateKeyboardEventOfType: aSymbol withKey: aCharacterOrSymbol 
	|transformedCharacter|
	transformedCharacter := KeyHandler preprocessInput: aCharacterOrSymbol.
	(Smalltalk platformName beginsWith: 'Mac') "transform back, so that it fits in the end"
		ifTrue: [transformedCharacter := KeyHandler macMapping
			keyAtValue: transformedCharacter].
	^ KeyboardEvent new
		setType: aSymbol
		buttons: 0
		position: nil
		keyValue: transformedCharacter
		hand: nil
		stamp: Time millisecondClockValue.
testing
createKeyboardEventOfType: aType withValue: aKeyValue
	^ KeyboardEvent new
		setType: aType
		buttons: 0
		position: nil
		keyValue: aKeyValue
		hand: GMMockHand new
		stamp: Time millisecondClockValue;
		yourself
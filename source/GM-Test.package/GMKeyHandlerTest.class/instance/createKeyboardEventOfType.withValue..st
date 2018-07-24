testing
createKeyboardEventOfType: aType withValue: aKeyValue
	^ KeyboardEvent new
		setType: aType
		buttons: 0
		position: nil
		keyValue: aKeyValue
		hand: nil
		stamp: Time millisecondClockValue;
		yourself
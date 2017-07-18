as yet unclassified
generateKeyboardEventOfType: aSymbol withKey: aCharacterOrSymbol 
	^ KeyboardEvent new
		setType: aSymbol
		buttons: 0
		position: nil
		keyValue: (KeyHandler preprocessInput: aCharacterOrSymbol)
		hand: nil
		stamp: Time eventMillisecondClock.
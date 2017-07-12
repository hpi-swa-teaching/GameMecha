keyHandling
preprocessInput: keySymbol
	^(keySymbol asString beginsWith: 'key')
		ifTrue: [[self class perform: keySymbol asSymbol]
			on: MessageNotUnderstood
			do: [^ self class invalidCharacter]]
		ifFalse: [self preprocessChar: keySymbol asCharacter].
as yet unclassified
preprocessInput: keySymbol
	^(keySymbol asString beginsWith: 'key')
		ifTrue: [[self perform: keySymbol asSymbol]
			on: MessageNotUnderstood
			do: [^ self invalidCharacter]]
		ifFalse: [self preprocessChar: keySymbol asCharacter].
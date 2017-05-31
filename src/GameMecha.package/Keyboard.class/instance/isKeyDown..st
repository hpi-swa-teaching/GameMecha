keyHandling
isKeyDown: keySymbol
	"Returns true if one of the keys corresponding to the KeySymbol is
	pressed. Each possible input is handled in a keySymbol. Returns false
	if the keySymbol is either unknown or no corresponding Key is
	pressed. (HOPLegacy)"
	|keys checker|
	checker := [:k | (self pressedKeys includes: k)
				ifTrue: [^ true]].
	keys := ([self perform: keySymbol]
		on: MessageNotUnderstood
		do: [^ false]).
	keys isCollection
		ifTrue: [keys do: checker]
		ifFalse: [checker value: keys].
	^ false.
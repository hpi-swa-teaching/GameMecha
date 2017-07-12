keyHandling
isKeyDown: keySymbol
	"Returns true if one of the keys corresponding to the KeySymbol is
	pressed. Each possible input is handled in a keySymbol. Returns false
	if the keySymbol is either unknown or no corresponding Key is
	pressed."
	"if the symbol is named like 'key*', it is interpreted as special method.
	Otherwise, it is taken literally as a button."
	|key checker|
	checker := [:keyAscii | (self pressedKeys includes: keyAscii)
				ifTrue: [^ true]].
	key := self preprocessInput: keySymbol.
	checker value: key.
	^ false.
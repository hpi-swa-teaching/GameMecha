test cases
testHasCollidedWithSymbolFalseWhenNoSymbolSet

	| event |
	event := self collisionEventOf: self morphWithoutSymbol with: self morphWithoutSymbol.
	self deny: (event hasCollidedWithSymbol: #anything)
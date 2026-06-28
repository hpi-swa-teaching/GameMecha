test cases
testHasCollidedWithSymbolFalseForMissedChildSymbol

	| composite target event |
	composite := self morphWithComposite.
	target := self morphWithoutSymbol.
	event := self collisionEventOf: target with: composite.
	self deny: (event hasCollidedWithSymbol: #body)
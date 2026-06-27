test cases
testHasCollidedWithSymbolTrueForCompositeSymbol

	| composite target event |
	composite := self morphWithComposite.
	target := self morphWithoutSymbol.
	event := self collisionEventOf: composite with: target.
	self assert: (event hasCollidedWithSymbol: #player)
test cases
testHasCollidedWithSymbolTrueForHitChildSymbol

	| composite target event |
	composite := self morphWithComposite.
	target := self morphWithoutSymbol.
	event := self collisionEventOf: target with: composite.
	self assert: (event hasCollidedWithSymbol: #head)
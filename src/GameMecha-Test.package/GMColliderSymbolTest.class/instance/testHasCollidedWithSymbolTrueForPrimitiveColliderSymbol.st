test cases
testHasCollidedWithSymbolTrueForPrimitiveColliderSymbol

	| event |
	event := self collisionEventOf: self morphWithoutSymbol with: (self morphWithColliderSymbol: #hitbox).
	self assert: (event hasCollidedWithSymbol: #hitbox)
test cases
testHasCollidedWithSymbolFalseForUnknownSymbol

	| event |
	event := self collisionEventOf: self morphWithoutSymbol with: (self morphWithColliderSymbol: #hitbox).
	self deny: (event hasCollidedWithSymbol: #unknown)
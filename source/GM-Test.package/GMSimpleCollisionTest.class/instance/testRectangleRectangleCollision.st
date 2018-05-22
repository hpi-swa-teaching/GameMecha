testing
testRectangleRectangleCollision
	self bigRectangle position: 0 @ 0.
	self smallRectangle position: (self class bigRectangleExtent x / 2) @ 0.
	self assert: [(self collisionHandler morphsCollidingWith: self bigRectangle) includes: self smallRectangle].
	self assert: [(self collisionHandler morphsCollidingWith: self smallRectangle) includes: self bigRectangle].
	self smallRectangle position: 0 @ (self class bigRectangleExtent y).
	self deny: [(self collisionHandler morphsCollidingWith: self bigRectangle) includes: self smallRectangle].
	self deny: [(self collisionHandler morphsCollidingWith: self bigRectangle) includes: self smallRectangle].
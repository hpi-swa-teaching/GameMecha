testing
testRectangleRectangleInCollisionCollection
	self bigRectangle position: self smallRectangle position.
	self 
		assert: [(self collisionHandler morphsCollidingWith: self smallRectangle) includes: self bigRectangle];
		assert: [(self collisionHandler morphsCollidingWith: self bigRectangle) includes: self smallRectangle].
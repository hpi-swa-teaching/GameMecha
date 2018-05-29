testing
testRectangleRectangleNotInCollisionCollection
	self smallRectangle position: self bigRectangle position + self bigRectangle extent.
	self 
		deny: [(self collisionHandler morphsCollidingWith: self smallRectangle) includes: self bigRectangle];
		deny: [(self collisionHandler morphsCollidingWith: self bigRectangle) includes: self smallRectangle].
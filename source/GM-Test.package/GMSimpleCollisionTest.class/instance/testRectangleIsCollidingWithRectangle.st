testing
testRectangleIsCollidingWithRectangle
	self bigRectangle position: 0 @ 0.
	self smallRectangle position: (self bigRectangleExtent x - 1) @ (self bigRectangleExtent y -1).
	self assert: [self collisionHandler is: self bigRectangle collidingWith: self smallRectangle].
	self assert: [self collisionHandler is: self smallRectangle collidingWith: self bigRectangle].
	self smallRectangle position: self bigRectangleExtent.
	self deny: [self collisionHandler is: self bigRectangle collidingWith: self smallRectangle].
	self deny: [self collisionHandler is: self smallRectangle collidingWith: self bigRectangle].
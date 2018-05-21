testing
testRectangleIsCollidingWithRectangle
	| rect1 rect2 |
	rect1 := Morph new.
	rect1 collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new.
	rect2 := Morph new.
	rect2 collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new.
	self collisionHandler addMorph: rect1.
	self collisionHandler addMorph: rect2.
	rect1 position: 100 @ 100.
	rect2 position: 100 @ 100.
	rect1 extent: 50 @ 50.
	rect2 extent: 50 @ 50.
	self assert: [self collisionHandler is: rect1 collidingWith: rect2].
	self assert: [self collisionHandler is: rect2 collidingWith: rect1].
	rect2 position: 200 @ 200.
	self deny: [self collisionHandler is: rect1 collidingWith: rect2].
	self deny: [self collisionHandler is: rect2 collidingWith: rect1].
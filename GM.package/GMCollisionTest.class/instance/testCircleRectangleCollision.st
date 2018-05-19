testing
testCircleRectangleCollision
	| rect circle |
	rect := Morph new.
	rect collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new.
	circle := CircleMorph new.
	circle collisionDetectionStrategy: GMRCircleCollisionDetectionStrategy new.
	self collisionHandler addMorph: rect.
	self collisionHandler addMorph: circle.
	rect position: 100 @ 100.
	circle position: 145 @ 100.
	rect extent: 50 @ 50.
	circle extent: 50 @ 50.
	self assert: [(self collisionHandler morphsCollidingWith: rect) includes: circle].
	self assert: [(self collisionHandler morphsCollidingWith: circle) includes: rect].
	circle position: 60 @ 60.
	self assert: [(self collisionHandler morphsCollidingWith: rect) includes: circle].
	self assert: [(self collisionHandler morphsCollidingWith: circle) includes: rect].
	circle position: 145 @ 145. 
	self deny: [(self collisionHandler morphsCollidingWith: rect) includes: circle].
	self deny: [(self collisionHandler morphsCollidingWith: circle) includes: rect].
	circle position: 55 @ 55.
	self deny: [(self collisionHandler morphsCollidingWith: rect) includes: circle].
	self deny: [(self collisionHandler morphsCollidingWith: circle) includes: rect].
testing
testCircleCircleCollision
	| circle1 circle2 |
	circle1 := Morph new.
	circle1 collisionDetectionStrategy: GMRCircleCollisionDetectionStrategy new.
	circle2 := CircleMorph new.
	circle2 collisionDetectionStrategy: GMRCircleCollisionDetectionStrategy new.
	self collisionHandler addMorph: circle1.
	self collisionHandler addMorph: circle2.
	circle1 position: 100 @ 100.
	circle2 position: 125 @ 100.
	circle1 extent: 50 @ 50.
	circle2 extent: 50 @ 50.
	self assert: [(self collisionHandler morphsCollidingWith: circle1) includes: circle2].
	self assert: [(self collisionHandler morphsCollidingWith: circle2) includes: circle1].
	circle2 position: 145 @ 145.
	self deny: [(self collisionHandler morphsCollidingWith: circle1) includes: circle2].
	self deny: [(self collisionHandler morphsCollidingWith: circle2) includes: circle1].
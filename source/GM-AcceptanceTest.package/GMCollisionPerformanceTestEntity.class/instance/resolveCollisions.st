collision
resolveCollisions
	| collidingMorphs |
	self move: 1.
	collidingMorphs := self parent collisionHandler morphsCollidingWith: self owner.
	collidingMorphs notEmpty ifTrue: [self move: -1. 
		self velocity: self velocity negated].
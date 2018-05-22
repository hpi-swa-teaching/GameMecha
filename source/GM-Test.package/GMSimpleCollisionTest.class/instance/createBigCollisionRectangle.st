creation
createBigCollisionRectangle
	| collisionRectangle |
	collisionRectangle := Morph new
		extent: self bigRectangleExtent;
		collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new.
	self collisionHandler addMorph: collisionRectangle.
	^ collisionRectangle
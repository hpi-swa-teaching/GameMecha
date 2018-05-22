creation
createSmallCollisionRectangle
	| collisionRectangle |
	collisionRectangle := Morph new
		extent: self smallRectangleExtent;
		collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new.
	self collisionHandler addMorph: collisionRectangle.
	^ collisionRectangle

creation
createCollisionRectangle
	| collisionRectangle |
	collisionRectangle := Morph new
		extent: self rectangleExtent;
		collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new.
	self collisionHandler addMorph: collisionRectangle.
	^ collisionRectangle
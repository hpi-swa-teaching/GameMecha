accessing
collisionMorphRectangle
	^ collisionMorphRectangle ifNil: [collisionMorphRectangle :=RectangleMorph new
			"To give a Morph the ability to collide it needs a GMCollisionDetectionShape. You can  choose between
			GMCircleCollisionDetectionShape, GMRectangleCollisionDetectionShape or GMRotatedRectangleCollisionDetectionShape."
			gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
			extent: self class collisionMorphExtent;
			position: (self class worldExtent x / 2) @ (self class worldExtent y / 3)]
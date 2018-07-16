creation
createCollisionMorphCircle
	^ collisionMorphCircle ifNil: [collisionMorphCircle := CircleMorph new
		"To give a Morph the ability to collide it needs a GMCollisionDetectionShape. You can  choose between
		GMCircleCollisionDetectionShape, GMRectangleCollisionDetectionShape or GMRotatedRectangleCollisionDetectionShape."
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		extent: self class collisionMorphExtent]
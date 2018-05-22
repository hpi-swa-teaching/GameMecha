accessing
collisionTestMorph
	^ collisionTestMorph ifNil: 
		[collisionTestMorph := Morph new
			extent: self class collisionMorphExtent;
			collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new;
			yourself]
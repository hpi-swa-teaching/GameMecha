accessing
collidingTestMorph
	^ collidingTestMorph ifNil: 
		[collidingTestMorph := Morph new
			extent: self class collisionMorphExtent;
			collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new;
			position: 0 @ 0;
			yourself]
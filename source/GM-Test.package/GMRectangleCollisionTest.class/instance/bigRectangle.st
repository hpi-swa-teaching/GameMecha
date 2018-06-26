accessing
bigRectangle
	^ bigRectangle ifNil: 
		[bigRectangle := Morph new
			extent: self class bigRectangleExtent;
			collisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
			position: 0 @ 0;
			yourself]
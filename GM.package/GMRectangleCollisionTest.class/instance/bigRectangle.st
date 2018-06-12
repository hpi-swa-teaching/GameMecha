accessing
bigRectangle
	^ bigRectangle ifNil: 
		[bigRectangle := Morph new
			extent: self class bigRectangleExtent;
			collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new;
			position: 0 @ 0;
			yourself]
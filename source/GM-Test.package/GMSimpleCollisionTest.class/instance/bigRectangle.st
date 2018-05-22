accessing
bigRectangle
	^ bigRectangle ifNil: 
		[bigRectangle := Morph new
			extent: self class bigRectangleExtent;
			collisionDetectionStrategy: GMRectangleCollisionDetectionStrategy new;
			yourself]
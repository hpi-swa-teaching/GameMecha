accessing
bigRectangle
	^ bigRectangle ifNil: 
		[bigRectangle := Morph new
			extent: self class bigRectangleExtent;
			gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
			position: 0 @ 0;
			yourself]
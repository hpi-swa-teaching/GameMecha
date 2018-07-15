accessing
bigRectangle
	^ bigRectangle ifNil: 
		[bigRectangle := Morph new
			extent: self class bigRectangleExtent;
			gmCollisionDetectionStrategy: self strategy;
			position: 0 @ 0;
			yourself]
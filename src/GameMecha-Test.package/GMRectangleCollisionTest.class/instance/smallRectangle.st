accessing
smallRectangle
	^ smallRectangle ifNil: 
		[smallRectangle := Morph new
			extent: self class smallRectangleExtent;
			gmCollisionDetectionStrategy: self strategy;
			yourself]
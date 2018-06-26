accessing
smallRectangle
	^ smallRectangle ifNil: 
		[smallRectangle := Morph new
			extent: self class smallRectangleExtent;
			collisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
			yourself]
accessing
rectangle
	^ rectangle ifNil: [rectangle := Morph new
		extent: self class rectangleExtent;
		position: 0 @ 0;
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		yourself]
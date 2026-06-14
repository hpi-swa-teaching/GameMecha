accessing
rectangleMorph

	^ rectangleMorph ifNil: [ | collider |
		collider := GMPrimitiveRectangleCollider new
			width: self class rectangleExtent x;
			height: self class rectangleExtent y;
			center: 0 @ 0;
			layers: #(1);
			mask: #(1);
			rotation: 0;
			yourself.
		rectangleMorph := GMCollisionTestMorph new
			collider: collider;
			extent: self class rectangleExtent;
			center: 0 @ 0;
			yourself]

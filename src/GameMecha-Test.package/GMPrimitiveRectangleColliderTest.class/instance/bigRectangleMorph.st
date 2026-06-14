accessing
bigRectangleMorph

	^ bigRectangleMorph ifNil: [ | collider |
		collider := GMPrimitiveRectangleCollider new
			width: self class bigRectangleExtent x;
			height: self class bigRectangleExtent y;
			center: 0 @ 0;
			layers: #(1);
			mask: #(1);
			yourself.
		bigRectangleMorph := GMCollisionTestMorph new
			collider: collider;
			extent: self class bigRectangleExtent;
			center: 0 @ 0;
			yourself]

accessing
smallRectangleMorph

	^ smallRectangleMorph ifNil: [ | collider |
		collider := GMPrimitiveRectangleCollider new
			width: self class smallRectangleExtent x;
			height: self class smallRectangleExtent y;
			center: 0 @ 0;
			layers: #(1);
			mask: #(1);
			yourself.
		smallRectangleMorph := GMCollisionTestMorph new
			collider: collider;
			extent: self class smallRectangleExtent;
			yourself]

accessing
rotatedRectMorph

	^ rotatedRectMorph ifNil: [ | collider |
		collider := GMPrimitiveRectangleCollider new
			width: self class rotatedRectExtent x;
			height: self class rotatedRectExtent y;
			center: 0 @ 0;
			rotation: self class rotatedRectAngle;
			layers: #(1);
			mask: #(1);
			yourself.
		rotatedRectMorph := GMCollisionTestMorph new
			collider: collider;
			extent: self class rotatedRectExtent;
			center: 0 @ 0;
			yourself]
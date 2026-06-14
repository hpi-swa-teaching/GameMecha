accessing
rotatedRectTallMorph

	^ rotatedRectTallMorph ifNil: [ | collider |
		collider := GMPrimitiveRectangleCollider new
			width: self class rotatedRectTallExtent x;
			height: self class rotatedRectTallExtent y;
			center: 0 @ 0;
			layers: #(1);
			mask: #(1);
			rotation: self class rotatedRectTallAngle;
			yourself.
		rotatedRectTallMorph := GMCollisionTestMorph new
			collider: collider;
			extent: self class rotatedRectTallExtent;
			center: 0 @ 0;
			yourself]
accessing
scaledRotatedRectMorph

	^ scaledRotatedRectMorph ifNil: [ | collider |
		collider := GMPrimitiveRectangleCollider new
			width:  self class rotatedRectExtent x / self class scaledRectScale;
			height: self class rotatedRectExtent y / self class scaledRectScale;
			center: 0 @ 0;
			rotation: self class rotatedRectAngle;
			layers: #(1);
			mask: #(1);
			scaleFactor: self class scaledRectScale;
			yourself.
		scaledRotatedRectMorph := GMCollisionTestMorph new
			collider: collider;
			center: 0 @ 0;
			yourself]
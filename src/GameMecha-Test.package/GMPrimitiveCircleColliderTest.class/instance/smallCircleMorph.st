accessing
smallCircleMorph

	^ smallCircleMorph ifNil: [ | collider |
		collider := GMPrimitiveCircleCollider new
			radius: self class smallCircleRadius;
			center: 0 @ 0;
			layers: #(1);
			mask: #(1);
			yourself.
		smallCircleMorph := GMCollisionTestMorph new
			collider: collider;
			extent: self class smallCircleDiameter;
			yourself]

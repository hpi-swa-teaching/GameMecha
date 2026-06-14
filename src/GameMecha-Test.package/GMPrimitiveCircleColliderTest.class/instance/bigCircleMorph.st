accessing
bigCircleMorph

	^ bigCircleMorph ifNil: [ | collider |
		collider := GMPrimitiveCircleCollider new
			center: 0 @ 0;
			radius: self class bigCircleRadius;
			layers: #(1);
			mask: #(1);
			yourself.
		bigCircleMorph := GMCollisionTestMorph new
			collider: collider;
			center: 0 @ 0;
			extent: self class bigCircleDiameter;
			yourself]


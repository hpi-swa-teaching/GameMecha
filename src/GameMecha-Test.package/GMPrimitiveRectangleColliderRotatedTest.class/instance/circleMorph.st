accessing
circleMorph

	^ circleMorph ifNil: [ | collider |
		collider := GMPrimitiveCircleCollider new
			radius: self class circleRadius;
			center: 0 @ 0;
			layers: #(1);
			mask: #(1);
			yourself.
		circleMorph := GMCollisionTestMorph new
			collider: collider;
			extent: self class circleDiameter;
			center: 0 @ 0;
			yourself]

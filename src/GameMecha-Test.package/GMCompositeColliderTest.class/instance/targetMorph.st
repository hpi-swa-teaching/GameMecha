accessing
targetMorph

	^ targetMorph ifNil: [ | collider |
		collider := GMPrimitiveCircleCollider new
			radius: 10;
			layers: #(1);
			mask: #(1);
			yourself.
		targetMorph := GMCollisionTestMorph new
			collider: collider;
			yourself]
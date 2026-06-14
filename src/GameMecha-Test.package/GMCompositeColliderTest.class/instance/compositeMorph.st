accessing
compositeMorph

	^ compositeMorph ifNil: [
		compositeMorph := GMCollisionTestMorph new
			collider: self buildCompositeCollider;
			center: 0 @ 0;
			yourself]


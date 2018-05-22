creation
createCircleCollisionMorph
	^ CircleMorph new
			collisionDetectionStrategy: GMCircleCollisionDetectionStrategy new;
			extent: 100 @ 100;
			yourself
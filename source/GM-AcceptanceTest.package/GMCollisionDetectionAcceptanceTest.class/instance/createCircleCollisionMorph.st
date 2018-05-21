initialization
createCircleCollisionMorph
	^ CircleMorph new
			collisionDetectionStrategy: GMRCircleCollisionDetectionStrategy new;
			extent: 100 @ 100;
			yourself
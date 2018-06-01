collision
circleCollisionMorph
	^ CircleMorph new
		collisionDetectionStrategy: GMCircleCollisionDetectionStrategy new;
		extent: 100 @ 100;
		position: self position;
		yourself
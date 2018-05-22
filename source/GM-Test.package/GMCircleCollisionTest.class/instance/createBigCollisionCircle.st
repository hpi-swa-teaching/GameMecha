creation
createBigCollisionCircle
	| collisionCircle |
	collisionCircle := CircleMorph new
		extent: (2 * self bigCircleRadius) @ (2 * self bigCircleRadius);
		collisionDetectionStrategy: GMCircleCollisionDetectionStrategy new.
	self collisionHandler addMorph: collisionCircle.
	^ collisionCircle
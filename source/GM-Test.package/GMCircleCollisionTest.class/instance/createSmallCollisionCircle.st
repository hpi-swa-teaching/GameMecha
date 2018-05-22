creation
createSmallCollisionCircle
	| collisionCircle |
	collisionCircle := CircleMorph new
		extent: (2 * self smallCircleRadius) @ (2 * self smallCircleRadius);
		collisionDetectionStrategy: GMCircleCollisionDetectionStrategy new.
	self collisionHandler addMorph: collisionCircle.
	^ collisionCircle
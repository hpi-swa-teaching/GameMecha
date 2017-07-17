morph
testRectangleCircleCollision
	collider1 := RectangleMorph new.
	collider1 collisionBehavior: (RectangleCollisionBehavior newOn: collider1).
	collider2 := CircleMorph new.
	collider2 collisionBehavior: (CircleCollisionBehavior newOn: collider2).
	self collisionBetweenRectangleAndCircle.
	collider1 := EllipseMorph new.
	collider1 collisionBehavior: (RectangleCollisionBehavior newOn: collider1).
	collider2 := RectangleMorph new.
	collider2 collisionBehavior: (CircleCollisionBehavior newOn: collider2).
	self collisionBetweenRectangleAndCircle.
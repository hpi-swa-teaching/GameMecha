morph
testRectangleRectangleCollision
	collider1 := RectangleMorph new.
	collider1 collisionBehavior: (RectangleCollisionBehavior newOn: collider1).
	collider2 := RectangleMorph new.
	collider2 collisionBehavior: (RectangleCollisionBehavior newOn: collider2).
	self collisionBetweenRectangleAndRectangle.
	collider1 := EllipseMorph new.
	collider1 collisionBehavior: (RectangleCollisionBehavior newOn: collider1).
	collider2 := EllipseMorph new.
	collider2 collisionBehavior: (RectangleCollisionBehavior newOn: collider2).
	self collisionBetweenRectangleAndRectangle.
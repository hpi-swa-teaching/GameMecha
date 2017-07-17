morph
testCircleCircleCollision
	collider1 := CircleMorph new.
	collider1 collisionBehavior: (CircleCollisionBehavior newOn: collider1).
	collider2 := CircleMorph new.
	collider2 collisionBehavior: (CircleCollisionBehavior newOn: collider2).
	self collisionBetweenCircleAndCircle.
	collider1 := RectangleMorph new.
	collider1 collisionBehavior: (CircleCollisionBehavior newOn: collider1).
	collider2 :=  RectangleMorph new.
	collider2 collisionBehavior: (CircleCollisionBehavior newOn: collider2).
	self collisionBetweenCircleAndCircle.
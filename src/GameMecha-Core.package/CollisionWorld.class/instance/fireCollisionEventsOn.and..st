as yet unclassified
fireCollisionEventsOn: collider1 and: collider2
	
	| collisionObject |
	collisionObject := CollisionEventObject newFrom: collider1 and: collider2.
	self collisionHandler value: collisionObject.
	collider1 collisionHandler value: collisionObject.
	collider2 collisionHandler value: collisionObject.
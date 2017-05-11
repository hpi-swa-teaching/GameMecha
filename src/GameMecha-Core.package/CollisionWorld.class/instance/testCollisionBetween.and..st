as yet unclassified
testCollisionBetween: collider1 and: collider2
	(collider1 intersects: collider2) ifTrue: [self collisionHandler value: (CollisionEventObject newFrom: collider1 and: collider2)].
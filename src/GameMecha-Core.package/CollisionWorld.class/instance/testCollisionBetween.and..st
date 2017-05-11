as yet unclassified
testCollisionBetween: collider1 and: collider2
	"check, if there is a collision between two colliders, and call the handler if needed"
	
	(collider1 intersects: collider2)
		ifTrue: [self collisionHandler value: (CollisionEventObject newFrom: collider1 and: collider2)].
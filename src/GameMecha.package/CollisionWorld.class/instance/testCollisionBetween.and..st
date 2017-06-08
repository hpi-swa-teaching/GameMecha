colliding
testCollisionBetween: collider1 and: collider2 
	"check, if there is a collision between two colliders, and call the handler
	if needed"
	"return, whether we moved the colliders"
	^ (collider1 touches: collider2)
		and: [self fireCollisionEventsOn: collider1 and: collider2].
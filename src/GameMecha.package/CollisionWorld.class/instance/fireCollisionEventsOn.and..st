colliding
fireCollisionEventsOn: collider1 and: collider2
	"return, whether we moved the colliders"
	
	| collisionObject bounds1 bounds2|
	bounds1 := collider1 bounds.
	bounds2 := collider2 bounds.
	collisionObject := CollisionEventObject newFrom: collider1 and: collider2.
	self collisionHandler value: collisionObject.
	collider1 collisionHandler value: collisionObject.
	collider2 collisionHandler value: collisionObject.
	
	^ (bounds1 ~= collider1 bounds) or: [bounds2 ~= collider2 bounds].
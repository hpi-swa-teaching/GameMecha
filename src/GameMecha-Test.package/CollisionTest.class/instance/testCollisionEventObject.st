event data structure
testCollisionEventObject
	"Tests the creation of eventObjects"
	|eventObject|
	collider1 := RectangleMorph new.
	collider1 collisionBehavior: RectangleCollisionBehavior new.
	collider2 := RectangleMorph new.
	collider2 collisionBehavior: RectangleCollisionBehavior new.
	eventObject := CollisionEventObject newFrom: collider1 and: collider2.
	
	self assert: (eventObject isCollider: collider1).
	self assert: (eventObject isCollider: collider2).
	self deny: (eventObject isCollider: 3).
	
	self assert: (eventObject collisionPartnerOf: collider1) equals: collider2.
	self assert: (eventObject collisionPartnerOf: collider2) equals: collider1.
	self assert: (eventObject collisionPartnerOf: 4) equals: nil.
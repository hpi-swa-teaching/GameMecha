event data structure
testCollisionEventObject
	|eventObject morph1 morph2|
	morph1 := RectangleCollider wrap: RectangleMorph new.
	morph2 := RectangleCollider wrap: RectangleMorph new.
	eventObject := CollisionEventObject newFrom: morph1 and: morph2.
	
	self assert: (eventObject isCollider: morph1).
	self assert: (eventObject isCollider: morph2).
	self deny: (eventObject isCollider: 3).
	
	self assert: (eventObject collisionPartnerOf: morph1) equals: morph2.
	self assert: (eventObject collisionPartnerOf: morph2) equals: morph1.
	self assert: (eventObject collisionPartnerOf: 4) equals: nil.
	
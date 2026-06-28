test cases
testUpdateNotifiesMorphForMultipleCollisions

	| morphC |
	morphC := self newCollisionMorph.
	
	self collisionManager addMorph: morphC.
	
	self collisionManager update.
	
	self assert: self morphA onCollisionCallCount equals: 2.
	self assert: self morphB onCollisionCallCount equals: 2.
	self assert: morphC onCollisionCallCount equals: 2
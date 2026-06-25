test cases
testUpdateNotifiesMorphForMultipleCollisions

	| morphC |
	morphC := self newCollisionMorph.
	
	morphA center: 0 @ 0.
	morphB center: 0 @ 0.
	morphC center: 0 @ 0.
	
	self collisionManager addMorph: morphC.
	
	self collisionManager update.
	
	self assert: morphA onCollisionCallCount equals: 2.
	self assert: morphB onCollisionCallCount equals: 2.
	self assert: morphC onCollisionCallCount equals: 2
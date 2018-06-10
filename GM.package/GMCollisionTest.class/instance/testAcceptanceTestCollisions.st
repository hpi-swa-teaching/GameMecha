as yet unclassified
testAcceptanceTestCollisions
	self collisionHandler: GMCollisionHandler new.
	self class collisionAcceptanceChecks do: [:each | 
		self collisionHandler addCollisionMorph: each firstMorph.
		self collisionHandler addCollisionMorph: each secondMorph.
		self assert: (self collisionHandler is: each firstMorph collidingWith: each secondMorph) equals: each shouldCollide].
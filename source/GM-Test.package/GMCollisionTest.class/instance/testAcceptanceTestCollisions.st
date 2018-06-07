as yet unclassified
testAcceptanceTestCollisions
	self collisionHandler: GMCollisionHandler new.
	self class collisionAcceptanceChecks do: [:each | 
		self collisionHandler addMorph: each firstMorph.
		self collisionHandler addMorph: each secondMorph.
		self assert: (self collisionHandler is: each firstMorph collidingWith: each secondMorph) equals: each shouldCollide].
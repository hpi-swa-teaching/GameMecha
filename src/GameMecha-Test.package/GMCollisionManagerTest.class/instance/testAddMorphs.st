test cases
testAddMorphs

	| m1 m2 |
	m1 := self newCollisionMorph.
	m2 := self newCollisionMorph.
	
	self collisionManager removeAllMorphs.
	self collisionManager addMorphs: {m1. m2}.
	
	self assert: (self collisionManager includes: m1).
	self assert: (self collisionManager includes: m2)
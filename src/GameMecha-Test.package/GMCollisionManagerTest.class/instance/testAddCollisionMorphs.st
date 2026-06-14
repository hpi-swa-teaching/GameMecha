test cases
testAddCollisionMorphs
	
	| morphA morphB |
	morphA := GMCollisionTestMorph new.
	morphB := GMCollisionTestMorph new.
	self collisionManager 
		removeAllMorphs;
		addMorphs: {morphA. morphB}.
	self 
		assert: [self collisionManager includes: morphA];
		assert: [self collisionManager includes: morphB]
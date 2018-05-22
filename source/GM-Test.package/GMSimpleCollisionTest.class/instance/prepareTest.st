as yet unclassified
prepareTest
	self collisionHandler removeAllMorphs.
	self assert: [self collisionHandler collisionMorphs isEmpty].
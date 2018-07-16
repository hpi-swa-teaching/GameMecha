test cases
testAnimatedImageLoading
	self assert: [self resourceManager cache isEmpty].
	self resourceManager loadResourceFromDrive: self exampleFile.
	self assert: [self resourceManager cache size = 1].
	self assertRessourceType: [self resourceManager at: self exampleFile].
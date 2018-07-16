test cases
testImageLoading
	self should: [self resourceManager at: self exampleFile] raise: Error.
	self resourceManager loadResourceFromDrive: self exampleFile.
	self assert: [self resourceManager cache size = 1].
	self assertRessourceType: [self resourceManager at: self exampleFile].
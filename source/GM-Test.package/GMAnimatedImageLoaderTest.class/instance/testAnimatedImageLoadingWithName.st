as yet unclassified
testAnimatedImageLoadingWithName
	self assert: [self resourceManager cache isEmpty].
	self resourceManager loadResourceFromDrive: self exampleFile withName: 'testName'.
	self assert: [self resourceManager cache size = 1].
	self assertRessourceType: [self resourceManager at: 'testName'].
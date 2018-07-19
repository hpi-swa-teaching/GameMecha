as yet unclassified
testSingleResourceLoading
	self should: [self resourceManager at: self class exampleFilepath] raise: Error.
	self resourceManager loadResourceFromDrive: self class exampleFilepath.
	self assert: [self resourceManager cache size = 1].
	self assertRessourceType: [self resourceManager at: self class exampleFilepath].
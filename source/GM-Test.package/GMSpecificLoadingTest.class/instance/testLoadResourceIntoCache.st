test cases
testLoadResourceIntoCache
	self resourceManager loadResourceFromObject: self class exampleResource withName: self class exampleFilepath.
	self assertRessourceType: [self resourceManager at: self class exampleFilepath].
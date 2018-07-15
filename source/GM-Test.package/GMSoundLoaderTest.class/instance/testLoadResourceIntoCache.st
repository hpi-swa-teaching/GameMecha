as yet unclassified
testLoadResourceIntoCache
	self resourceManager loadResourceFromObject: GMTestResourceFixtures squeakSamplesSound withName: self exampleFile .
	self assertRessourceType: [self resourceManager at: self exampleFile].
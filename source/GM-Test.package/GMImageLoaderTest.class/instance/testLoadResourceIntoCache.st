test cases
testLoadResourceIntoCache
	self resourceManager loadResourceFromObject: (GMTestResourceFixtures squeakPNG) withName: GMTestResourceFixtures fileName.
	self assertRessourceType: [self resourceManager at: GMTestResourceFixtures fileName].
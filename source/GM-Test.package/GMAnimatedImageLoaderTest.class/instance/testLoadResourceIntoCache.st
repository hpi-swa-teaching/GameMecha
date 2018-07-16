test cases
testLoadResourceIntoCache
	self resourceManager loadResourceFromObject: (GMTestResourceFixtures squeakGIFReadWriter) withName: GMTestResourceFixtures fileName.
	self assertRessourceType: [self resourceManager at: GMTestResourceFixtures fileName].
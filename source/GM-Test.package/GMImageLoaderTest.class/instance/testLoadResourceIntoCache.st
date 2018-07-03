testing
testLoadResourceIntoCache
	self resourceManager loadResource: (GMTestResourceFixtures squeakPNG) intoCacheWithName: GMTestResourceFixtures fileName.
	self assert: [(self resourceManager at: GMTestResourceFixtures fileName) isForm].
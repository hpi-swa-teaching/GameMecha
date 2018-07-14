testing
testLoadResourceIntoCache
	self resourceManager loadResourceFromObject: (GMTestResourceFixtures squeakPNG) withName: GMTestResourceFixtures fileName.
	self assert: [(self resourceManager at: GMTestResourceFixtures fileName) isForm].
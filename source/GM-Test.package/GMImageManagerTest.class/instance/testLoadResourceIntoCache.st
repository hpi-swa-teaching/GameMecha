as yet unclassified
testLoadResourceIntoCache
	self resourceManager loadResource: (GMTestResourceFixtures squeakPNG) intoCacheWithName: GMTestResourceFixtures fileName.
	self assert: [(self resourceManager getImageForm: GMTestResourceFixtures fileName) isForm].
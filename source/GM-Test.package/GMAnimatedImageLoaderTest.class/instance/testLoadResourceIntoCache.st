as yet unclassified
testLoadResourceIntoCache
	self resourceManager loadResource: (GMTestResourceFixtures squeakGIFReadWriter) intoCacheWithName: GMTestResourceFixtures fileName.
	(self resourceManager at: GMTestResourceFixtures fileName) forms.
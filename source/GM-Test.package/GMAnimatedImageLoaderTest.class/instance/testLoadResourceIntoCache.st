as yet unclassified
testLoadResourceIntoCache
	self resourceManager loadResourceFromObject: (GMTestResourceFixtures squeakGIFReadWriter) withName: GMTestResourceFixtures fileName.
	(self resourceManager at: GMTestResourceFixtures fileName) forms.
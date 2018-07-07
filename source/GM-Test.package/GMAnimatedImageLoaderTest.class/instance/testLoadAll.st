as yet unclassified
testLoadAll
	self resourceManager loadAllResourcesFrom: GMTestResourceFixtures testResourceFolder.
	(self resourceManager at: GMTestResourceFixtures testImagePathGIF) forms; delays.
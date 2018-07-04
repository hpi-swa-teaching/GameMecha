as yet unclassified
testLoadAll
	self executeIfLocal: 
		[self resourceManager loadAllResourcesFrom: GMTestResourceFixtures testResourceFolder.
		(self resourceManager at: GMTestResourceFixtures testImagePathGIF) forms].
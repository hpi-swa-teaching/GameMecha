as yet unclassified
testLoadAll
	self resourceManager loadAllResourcesFromDrive: GMTestResourceFixtures testResourceFolder.
	(self resourceManager at: GMTestResourceFixtures testImagePathGIF) forms; delays.
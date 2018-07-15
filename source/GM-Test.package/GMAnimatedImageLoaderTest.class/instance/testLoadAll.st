as yet unclassified
testLoadAll
	self resourceManager loadAllResourcesFromDrive: GMTestResourceFixtures testResourceFolder.
	self flag: #todo. "loads only one"
	self assertRessourceType: [self resourceManager at: GMTestResourceFixtures testImagePathGIF].
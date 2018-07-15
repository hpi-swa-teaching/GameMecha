testing
testLoadAll
	self loadAll.
	self assertRessourceType: [self resourceManager at: GMTestResourceFixtures testImagePathPNG].
	self assertRessourceType: [self resourceManager at: GMTestResourceFixtures testImagePathJPEG].
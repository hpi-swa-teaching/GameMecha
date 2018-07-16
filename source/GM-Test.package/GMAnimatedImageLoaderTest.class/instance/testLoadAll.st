test cases
testLoadAll
	self loadAll.
	self flag: #todo. "loads only one"
	self assertRessourceType: [self resourceManager at: GMTestResourceFixtures testImagePathGIF].
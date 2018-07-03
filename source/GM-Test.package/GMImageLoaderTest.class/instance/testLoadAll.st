testing
testLoadAll
	super testLoadAll.
	self resourceManager
		at: GMTestResourceFixtures testImagePathPNG;
		at: GMTestResourceFixtures testImagePathJPEG.
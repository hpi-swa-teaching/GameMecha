testing
testLoadAll
	super testLoadAll.
	self resourceManager
		getImageForm: GMTestResourceFixtures testImagePathPNG;
		getImageForm: GMTestResourceFixtures testImagePathJPEG.
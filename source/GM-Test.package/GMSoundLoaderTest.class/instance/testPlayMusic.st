as yet unclassified
testPlayMusic
	self resourceManager
		loadResourceFromObject: GMTestResourceFixtures squeakSamplesSound withName: self testFile;
		playMusic: self testFile;
		pauseMusic.
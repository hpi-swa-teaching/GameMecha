as yet unclassified
testPauseMusic
	self resourceManager
		loadResourceFromObject: GMTestResourceFixtures squeakSamplesSound withName: self testFile;
		playMusic: self testFile;
		pauseMusic.
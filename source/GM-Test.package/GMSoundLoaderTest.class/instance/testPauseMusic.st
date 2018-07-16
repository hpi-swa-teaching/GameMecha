test cases
testPauseMusic
	self resourceManager
		loadResourceFromObject: GMTestResourceFixtures squeakSamplesSound withName: self exampleFile;
		playMusic: self exampleFile;
		pauseMusic.
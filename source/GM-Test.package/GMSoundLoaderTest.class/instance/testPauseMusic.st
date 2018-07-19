test cases
testPauseMusic
	self resourceManager
		loadResourceFromObject: GMTestResourceFixtures squeakSampledSound withName: self class exampleFilepath;
		playMusic: self class exampleFilepath;
		pauseMusic.
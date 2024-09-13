test cases
testPlayPauseMusic
	self resourceManager
		loadResourceFromObject: GMTestResourceFixtures squeakSampledSound withName: self class exampleFilepath;
		playMusic: self class exampleFilepath;
		pauseMusic.
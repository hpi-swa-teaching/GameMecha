test cases
testPlayMusic
	self resourceManager
		loadResourceFromObject: GMTestResourceFixtures squeakSampledSound withName: self class exampleFilepath;
		playMusic: self class exampleFilepath;
		pauseMusic.
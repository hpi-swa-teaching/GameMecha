as yet unclassified
testPlayMusic
	self resourceManager
		loadResourceFromObject: GMTestResourceFixtures squeakSamplesSound withName: self exampleFile;
		playMusic: self exampleFile;
		pauseMusic.
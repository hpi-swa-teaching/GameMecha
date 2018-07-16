test cases
testPlayNamedSound
	self resourceManager
		loadResourceFromObject: GMTestResourceFixtures squeakSamplesSound withName: self exampleFile;
		playSound: self exampleFile.
as yet unclassified
testPlayNamedSound
	self resourceManager
		loadResourceFromObject: GMTestResourceFixtures squeakSamplesSound withName: self testFile;
		playSound: self testFile.
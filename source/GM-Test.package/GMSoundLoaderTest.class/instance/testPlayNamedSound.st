test cases
testPlayNamedSound
	self resourceManager
		loadResourceFromObject: GMTestResourceFixtures squeakSampledSound withName: self class exampleFilepath;
		playSound: self class exampleFilepath.
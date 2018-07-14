as yet unclassified
testPlayNamedSound
	self resourceManager
		loadResourceFromDrive: self testFile withName: GMTestResourceFixtures fileName;
		playSound: GMTestResourceFixtures fileName.
as yet unclassified
testPlayNamedSound
	self resourceManager
		loadResourceFromDriveIntoCache: self testFile withName: GMTestResourceFixtures fileName;
		playSound: GMTestResourceFixtures fileName.
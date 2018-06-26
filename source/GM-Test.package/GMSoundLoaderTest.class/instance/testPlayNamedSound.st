as yet unclassified
testPlayNamedSound
	self resourceManager
		loadResourceFromDriveIntoCache: GMTestResourceFixtures testSoundPathWAV withName: GMTestResourceFixtures fileName;
		playSound: GMTestResourceFixtures fileName.
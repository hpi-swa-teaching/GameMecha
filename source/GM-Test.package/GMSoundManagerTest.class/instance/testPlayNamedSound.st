as yet unclassified
testPlayNamedSound
	self resourceManager
		loadResourceIntoCache: GMTestResourceFixtures testSoundPathWAV withName: GMTestResourceFixtures fileName;
		playSound: GMTestResourceFixtures fileName.
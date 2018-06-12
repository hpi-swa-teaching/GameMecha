as yet unclassified
testPlayNamedSound
	self resourceManager
		loadResourceIntoCache: TestResourceFixtures testSoundPathWAV withName: TestResourceFixtures fileName;
		playSound: TestResourceFixtures fileName.
as yet unclassified
testPlaySoundWAV
	self resourceManager
		loadResourceIntoCache: TestResourceFixtures testSoundPathWAV;
		playSound: TestResourceFixtures testSoundNameWAV.
as yet unclassified
testPlaySoundWAV
	self prepareTest.
	self soundManager
		loadResourceIntoCache: TestResourceFixtures testSoundPathWAV;
		playSound: TestResourceFixtures testSoundNameWAV.
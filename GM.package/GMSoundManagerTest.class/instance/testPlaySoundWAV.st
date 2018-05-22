as yet unclassified
testPlaySoundWAV
	self prepareTest.
	self soundManager
		loadResourceIntoCache: TestResourceCreator testSoundPathWAV;
		playSound: TestResourceCreator testSoundNameWAV.
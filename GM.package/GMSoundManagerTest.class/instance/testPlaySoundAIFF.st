as yet unclassified
testPlaySoundAIFF
	self prepareTest.
	self soundManager
		loadResourceIntoCache: TestResourceCreator testSoundPathAIFF;
		playSound: TestResourceCreator testSoundNameAIFF.
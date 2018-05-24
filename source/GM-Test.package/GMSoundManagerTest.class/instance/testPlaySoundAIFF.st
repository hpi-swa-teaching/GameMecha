as yet unclassified
testPlaySoundAIFF
	self prepareTest.
	self soundManager
		loadResourceIntoCache: TestResourceFixtures testSoundPathAIFF;
		playSound: TestResourceFixtures testSoundNameAIFF.
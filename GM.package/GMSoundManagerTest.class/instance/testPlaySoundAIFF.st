as yet unclassified
testPlaySoundAIFF
	self prepareTest.
	self soundManager
		loadResourceIntoCache: self class testSoundNameAIFF;
		playSound: self class testSoundNameAIFF.
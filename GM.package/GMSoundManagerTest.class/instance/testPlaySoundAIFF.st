as yet unclassified
testPlaySoundAIFF
	self prepareTest.
	self soundManager
		loadResourceIntoCache: self class testSoundPathAIFF;
		playSound: self class testSoundNameAIFF.
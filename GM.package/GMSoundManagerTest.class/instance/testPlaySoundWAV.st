as yet unclassified
testPlaySoundWAV
	self prepareTest.
	self soundManager
		loadResourceIntoCache: self class testSoundNameWAV;
		playSound: self class testSoundNameWAV.
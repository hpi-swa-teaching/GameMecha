as yet unclassified
testPlaySoundWAV
	self prepareTest.
	self soundManager
		loadResourceIntoCache: self class testSoundPathWAV;
		playSound: self class testSoundNameWAV.
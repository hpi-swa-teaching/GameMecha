as yet unclassified
testPlaySoundWAV
	self prepareTest.
	self soundManager
		loadResourceIntoCache: self class testSoundNameWAV;
		playSound: FileDirectory localName self class testSoundNameWAV.
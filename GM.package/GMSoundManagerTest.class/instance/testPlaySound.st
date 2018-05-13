as yet unclassified
testPlaySound
	self prepareTest.
	self soundManager
		loadResourceIntoCache: self class testSoundName;
		playSound: self class testSoundName.
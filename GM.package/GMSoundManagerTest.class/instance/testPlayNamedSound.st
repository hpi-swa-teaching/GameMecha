as yet unclassified
testPlayNamedSound
	self prepareTest.
	self soundManager
		loadResourceIntoCache: self class testSoundName withName: #squeak;
		playSound: #squeak.
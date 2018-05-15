as yet unclassified
testPlayNamedSound
	self prepareTest.
	self soundManager
		loadResourceIntoCache: self class testSoundNameWAV withName: #squeak;
		playSound: #squeak.
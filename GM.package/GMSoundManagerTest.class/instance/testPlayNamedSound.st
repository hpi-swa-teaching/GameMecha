as yet unclassified
testPlayNamedSound
	self prepareTest.
	self soundManager
		loadResourceIntoCache: self class testSoundPathWAV  withName: 'squeak';
		playSound: 'squeak'.
as yet unclassified
testPlayNamedSound
	self prepareTest.
	self soundManager
		loadResourceIntoCache: TestResourceCreator testSoundPathWAV withName: 'squeak';
		playSound: 'squeak'.
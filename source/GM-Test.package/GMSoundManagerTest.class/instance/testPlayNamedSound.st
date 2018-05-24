as yet unclassified
testPlayNamedSound
	self prepareTest.
	self soundManager
		loadResourceIntoCache: TestResourceFixtures testSoundPathWAV withName: 'squeak';
		playSound: 'squeak'.
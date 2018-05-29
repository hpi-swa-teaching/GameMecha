as yet unclassified
testPlayNamedSound
	self soundManager
		loadResourceIntoCache: TestResourceFixtures testSoundPathWAV withName: 'squeak';
		playSound: 'squeak'.
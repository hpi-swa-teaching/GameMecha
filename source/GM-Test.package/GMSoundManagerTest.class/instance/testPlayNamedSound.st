as yet unclassified
testPlayNamedSound
	self resourceManager
		loadResourceIntoCache: TestResourceFixtures testSoundPathWAV withName: 'squeak';
		playSound: 'squeak'.
as yet unclassified
testPlayMusic
	self prepareTest.
	self soundManager
		loadResourceIntoCache: TestResourceFixtures testSoundPathWAV;
		playMusic: TestResourceFixtures testSoundNameWAV;
		pauseMusic.
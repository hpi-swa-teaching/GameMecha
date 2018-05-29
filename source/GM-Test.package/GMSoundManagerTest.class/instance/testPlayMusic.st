as yet unclassified
testPlayMusic
	self soundManager
		loadResourceIntoCache: TestResourceFixtures testSoundPathWAV;
		playMusic: TestResourceFixtures testSoundNameWAV;
		pauseMusic.
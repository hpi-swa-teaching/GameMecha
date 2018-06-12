as yet unclassified
testPlayMusic
	self resourceManager
		loadResourceIntoCache: TestResourceFixtures testSoundPathWAV;
		playMusic: TestResourceFixtures testSoundNameWAV;
		pauseMusic.
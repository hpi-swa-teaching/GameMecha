as yet unclassified
testPlayMusic
	self prepareTest.
	self soundManager
		loadResourceIntoCache: TestResourceCreator testSoundPathWAV;
		playMusic: TestResourceCreator testSoundNameWAV;
		pauseMusic.
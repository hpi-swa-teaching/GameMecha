as yet unclassified
testPlayMusic
	self resourceManager
		loadResourceIntoCache: GMTestResourceFixtures testSoundPathWAV;
		playMusic: GMTestResourceFixtures testSoundNameWAV;
		pauseMusic.
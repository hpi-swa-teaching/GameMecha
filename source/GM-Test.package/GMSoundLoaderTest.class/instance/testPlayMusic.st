as yet unclassified
testPlayMusic
	self resourceManager
		loadResourceFromDriveIntoCache: GMTestResourceFixtures testSoundPathWAV;
		playMusic: GMTestResourceFixtures testSoundPathWAV;
		pauseMusic.
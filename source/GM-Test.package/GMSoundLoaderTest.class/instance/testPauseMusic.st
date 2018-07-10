as yet unclassified
testPauseMusic
	self resourceManager
		loadResourceFromDriveIntoCache: self testFile;
		playMusic: self testFile;
		pauseMusic.
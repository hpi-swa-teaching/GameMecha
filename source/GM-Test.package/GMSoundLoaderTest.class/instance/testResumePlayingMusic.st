as yet unclassified
testResumePlayingMusic
	self resourceManager
		loadResourceFromDriveIntoCache: self testFile;
		playMusic: self testFile;
		pauseMusic;
		resumePlayingMusic;
		pauseMusic.
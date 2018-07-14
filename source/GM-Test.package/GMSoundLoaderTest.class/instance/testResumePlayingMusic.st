as yet unclassified
testResumePlayingMusic
	self resourceManager
		loadResourceFromDrive: self testFile;
		playMusic: self testFile;
		pauseMusic;
		resumePlayingMusic;
		pauseMusic.
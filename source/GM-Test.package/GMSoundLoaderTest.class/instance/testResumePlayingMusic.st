as yet unclassified
testResumePlayingMusic
	self resourceManager
		loadResourceFromDrive: self exampleFile;
		playMusic: self exampleFile;
		pauseMusic;
		resumePlayingMusic;
		pauseMusic.
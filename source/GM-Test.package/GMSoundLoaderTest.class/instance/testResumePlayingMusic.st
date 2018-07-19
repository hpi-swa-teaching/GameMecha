test cases
testResumePlayingMusic
	self resourceManager
		loadResourceFromDrive: self class exampleFilepath;
		playMusic: self class exampleFilepath;
		pauseMusic;
		resumePlayingMusic;
		pauseMusic.
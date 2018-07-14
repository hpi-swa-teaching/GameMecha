as yet unclassified
testPauseMusic
	self resourceManager
		loadResourceFromDrive: self testFile;
		playMusic: self testFile;
		pauseMusic.
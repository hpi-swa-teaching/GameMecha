as yet unclassified
testPlayMusic
	self resourceManager
		loadResourceFromDrive: self testFile;
		playMusic: self testFile;
		pauseMusic.
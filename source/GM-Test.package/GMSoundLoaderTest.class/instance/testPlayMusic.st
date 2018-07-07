as yet unclassified
testPlayMusic
	self resourceManager
		loadResourceFromDriveIntoCache: self testFile;
		playMusic: self testFile;
		pauseMusic.
as yet unclassified
testPlayMusic
	self prepareTest.
	self soundManager
		loadResourceIntoCache: self class testSoundPathWAV;
		playMusic: self class testSoundNameWAV;
		pauseMusic.
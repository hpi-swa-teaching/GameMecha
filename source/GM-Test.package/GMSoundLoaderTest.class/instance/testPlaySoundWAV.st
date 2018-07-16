test cases
testPlaySoundWAV
	self resourceManager
		loadResourceFromDrive: GMTestResourceFixtures testSoundPathWAV;
		playSound: GMTestResourceFixtures testSoundPathWAV.
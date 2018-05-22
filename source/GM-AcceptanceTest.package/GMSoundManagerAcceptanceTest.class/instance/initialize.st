as yet unclassified
initialize
	GMSoundManager instance
		loadAllResourcesFrom: TestResourceCreator testResourceFolder;
		loudness: 0.0;
		playSound: TestResourceCreator testSoundNameWAV;
		playMusic: TestResourceCreator testSoundNameWAV;
		pauseMusic.
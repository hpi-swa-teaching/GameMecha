as yet unclassified
initialize
	GMSoundManager instance
		loadAllResourcesFrom: 'testingResources/';
		loudness: 1.0;
		playSound: GMSoundManagerTest testSoundNameWAV;
		playMusic: GMSoundManagerTest testSoundNameWAV;
		pauseMusic.
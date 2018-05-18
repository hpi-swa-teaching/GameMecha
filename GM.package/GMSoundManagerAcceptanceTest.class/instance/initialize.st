as yet unclassified
initialize
	GMSoundManager instance
		loadAllResourcesFrom: 'testingResources/';
		playSound: GMSoundManagerTest testSoundNameWAV;
		playMusic: GMSoundManagerTest testSoundNameWAV;
		loudness: 0.5;
		pauseMusic.
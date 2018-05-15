as yet unclassified
initialize
	GMSoundManager instance
		loadAllResourcesFrom: 'testingResources/';
		playSound: GMSoundManagerTest testSoundNameWAV.
	self abandon.
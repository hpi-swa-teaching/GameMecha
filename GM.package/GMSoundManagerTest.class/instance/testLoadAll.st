as yet unclassified
testLoadAll
	self prepareTest.
	self soundManager
		loadAllResourcesFrom: '';
		playSound: self class testSoundNameWAV.
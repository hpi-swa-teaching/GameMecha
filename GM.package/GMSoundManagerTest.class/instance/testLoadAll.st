as yet unclassified
testLoadAll
	self prepareTest.
	self soundManager
		loadAllResourcesFrom: 'testingResources/';
		playSound: (FileDirectory uri: self class testSoundNameWAV) localName.
as yet unclassified
testLoadAll
	self prepareTest.
	self soundManager
		loadAllResourcesFrom: TestResourceCreator testResourceFolder;
		playSound: (FileDirectory uri: TestResourceCreator testSoundNameWAV) localName.
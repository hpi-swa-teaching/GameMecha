as yet unclassified
testLoadAll
	self prepareTest.
	self soundManager
		loadAllResourcesFrom: TestResourceFixtures testResourceFolder;
		playSound: (FileDirectory uri: TestResourceFixtures testSoundNameWAV) localName.
as yet unclassified
testLoadAll
	self soundManager
		loadAllResourcesFrom: TestResourceFixtures testResourceFolder;
		playSound: (FileDirectory uri: TestResourceFixtures testSoundNameWAV) localName.
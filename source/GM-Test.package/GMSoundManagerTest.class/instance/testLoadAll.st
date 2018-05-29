as yet unclassified
testLoadAll
	self resourceManager
		loadAllResourcesFrom: TestResourceFixtures testResourceFolder;
		playSound: (FileDirectory uri: TestResourceFixtures testSoundNameWAV) localName.
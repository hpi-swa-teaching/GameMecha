as yet unclassified
testLoadAllWithNames
	self prepareTest.
	self soundManager
		loadAllResourcesWithNamesFrom: '';
		playSound: (self soundManager firstNameFromFilename: (self class testSoundNameWAV) asSymbol).
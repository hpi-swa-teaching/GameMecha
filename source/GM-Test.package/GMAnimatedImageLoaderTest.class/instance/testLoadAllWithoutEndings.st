as yet unclassified
testLoadAllWithoutEndings
	self executeIfLocal: 
		[self resourceManager loadAllResourcesWithoutEndingsFrom: GMTestResourceFixtures testResourceFolder.
		(self resourceManager at: GMTestResourceFixtures testResourceFolder, GMTestResourceFixtures fileName) forms].
as yet unclassified
testLoadAllWithoutEndings
	self executeIfLocal: 
		[self resourceManager loadAllResourcesWithoutEndingsFrom: GMTestResourceFixtures testResourceFolderLocal.
		(self resourceManager at: GMTestResourceFixtures testResourceFolderLocal , GMTestResourceFixtures fileName) forms].
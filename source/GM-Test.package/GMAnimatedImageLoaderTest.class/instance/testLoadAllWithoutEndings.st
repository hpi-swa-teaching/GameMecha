as yet unclassified
testLoadAllWithoutEndings
	self resourceManager loadAllResourcesWithoutEndingsFrom: GMTestResourceFixtures testResourceFolder.
	(self resourceManager at: GMTestResourceFixtures testResourceFolder, GMTestResourceFixtures fileName) forms; delays.
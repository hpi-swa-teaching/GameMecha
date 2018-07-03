as yet unclassified
testLoadAll
	self executeIfLocal: 
		[self resourceManager loadAllResourcesFrom: GMTestResourceFixtures testResourceFolderLocal.
		(self resourceManager at: GMTestResourceFixtures testImagePathGIF) forms].
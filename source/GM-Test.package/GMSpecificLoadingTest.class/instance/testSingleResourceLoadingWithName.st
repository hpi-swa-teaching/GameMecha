test cases
testSingleResourceLoadingWithName
	self should: [self resourceManager at: GMTestResourceFixtures fileName] raise: Error.
	self resourceManager loadResourceFromDrive: self class exampleFilepath withName: GMTestResourceFixtures fileName.
	self assertRessourceType: [self resourceManager at: GMTestResourceFixtures fileName].
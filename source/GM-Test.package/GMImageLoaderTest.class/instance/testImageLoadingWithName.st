test cases
testImageLoadingWithName
	self should: [self resourceManager at: GMTestResourceFixtures fileName] raise: Error.
	self resourceManager loadResourceFromDrive: self exampleFile withName: GMTestResourceFixtures fileName.
	self assertRessourceType: [self resourceManager at: GMTestResourceFixtures fileName].
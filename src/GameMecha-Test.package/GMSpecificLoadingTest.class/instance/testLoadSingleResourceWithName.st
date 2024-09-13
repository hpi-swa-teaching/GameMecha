test cases
testLoadSingleResourceWithName
	self deny: [self resourceManager cache includesKey: GMTestResourceFixtures fileName].
	self resourceManager loadResourceFromDrive: self class exampleFilepath withName: GMTestResourceFixtures fileName.
	self assertEntryIsCorrect: GMTestResourceFixtures fileName.
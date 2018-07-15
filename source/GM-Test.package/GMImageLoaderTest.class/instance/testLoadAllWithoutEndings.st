testing
testLoadAllWithoutEndings
	self loadAllWithoutEndings.
	self assertRessourceType: [self resourceManager at: GMTestResourceFixtures testResourceFolder , GMTestResourceFixtures fileName].
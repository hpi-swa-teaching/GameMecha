test cases
testLoadAllWithoutEndings
	self loadAllWithoutEndings.
	self assertEntryIsCorrect: GMTestResourceFixtures testResourceFolder, GMTestResourceFixtures fileName.
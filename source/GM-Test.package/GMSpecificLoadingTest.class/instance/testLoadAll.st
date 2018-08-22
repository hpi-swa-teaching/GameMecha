test cases
testLoadAll
	self 
		loadAll;
		assertEntryIsCorrect: self class exampleFilepath;
		assertEntryIsCorrect: self class secondExampleFilepath.
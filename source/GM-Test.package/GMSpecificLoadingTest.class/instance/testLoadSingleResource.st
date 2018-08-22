test cases
testLoadSingleResource
	self deny: [self resourceManager cache includesKey: self class exampleFilepath].
	self resourceManager loadResourceFromDrive: self class exampleFilepath.
	self assertEntryIsCorrect: self class exampleFilepath.
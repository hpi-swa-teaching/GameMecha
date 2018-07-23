test cases
testLoadResourceIntoCache
	self resourceManager loadResourceFromObject: self class exampleResource withName: self class exampleFilepath.
	self assertEntryIsCorrect: self class exampleFilepath.
test cases
testGetImageWithSize
	self resourceManager loadResourceFromDrive: self class exampleFilepath.
	self assert: (self resourceManager at: self class exampleFilepath withSize: self class testSize) extent 
		equals: self class testSize.
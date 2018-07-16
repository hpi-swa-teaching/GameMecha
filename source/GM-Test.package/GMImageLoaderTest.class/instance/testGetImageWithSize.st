test cases
testGetImageWithSize
	self resourceManager loadResourceFromDrive: self exampleFile.
	self assert: (self resourceManager at: self exampleFile withSize: self class testSize) extent 
		equals: self class testSize.
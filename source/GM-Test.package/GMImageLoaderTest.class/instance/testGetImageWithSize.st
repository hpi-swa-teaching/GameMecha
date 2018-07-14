testing
testGetImageWithSize
	self resourceManager loadResourceFromDrive: self testFile.
	self assert: (self resourceManager at: self testFile withSize: self class testSize) extent 
		equals: self class testSize.
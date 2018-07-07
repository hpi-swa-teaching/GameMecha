testing
testGetImageWithSize
	self resourceManager loadResourceFromDriveIntoCache: self testFile.
	self assert: (self resourceManager at: self testFile withSize: self class testSize) extent 
		equals: self class testSize.
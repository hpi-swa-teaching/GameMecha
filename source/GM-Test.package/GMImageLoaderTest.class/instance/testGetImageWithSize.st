testing
testGetImageWithSize
	self resourceManager loadResourceFromDriveIntoCache: GMTestResourceFixtures testImagePathPNG.
	self assert: (self resourceManager getImageForm: GMTestResourceFixtures testImagePathPNG withSize: self class testSize) extent 
		equals: self class testSize.
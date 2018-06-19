testing
testGetImageWithSize
	self resourceManager loadResourceIntoCache: GMTestResourceFixtures testImagePathPNG.
	self 
		assert: (self resourceManager getImageForm: GMTestResourceFixtures testImageNamePNG withSize: self class testSize) extent 
		equals: self class testSize.
testing
testGetImageWithSize
	self resourceManager loadResourceIntoCache: TestResourceFixtures testImagePathPNG.
	self assert: [(self resourceManager getImageForm: TestResourceFixtures testImageNamePNG withSize: self class testSize) extent = self class testSize].
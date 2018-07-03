as yet unclassified
testAnimatedImageLoadingWithName
	self should: [self resourceManager getAnimationGIFReader: GMTestResourceFixtures testImageNamePNG] raise: Error.
	self resourceManager loadResourceFromDriveIntoCache: GMTestResourceFixtures testImageNameGIF.
	self assert: [self resourceManager cache size = 1].
	self resourceManager getAnimationGIFReader: GMTestResourceFixtures testImageNameGIF.
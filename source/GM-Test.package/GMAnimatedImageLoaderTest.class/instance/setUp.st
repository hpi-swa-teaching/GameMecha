testing
setUp
	super setUp.
	self resourceManager: GMAnimatedImageLoader new.
	GMTestResourceFixtures createAnimatedImagesOnDisk.
	
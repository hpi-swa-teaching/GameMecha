as yet unclassified
setUp
	super setUp.
	self resourceManager: GMAnimatedImageLoader new.
	GMTestResourceFixtures createAnimatedImagesOnDisk.
	
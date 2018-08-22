running
setUp
	super setUp.
	self resourceManager: GMImageLoader new.
	GMTestResourceFixtures createImagesOnDisk.
	
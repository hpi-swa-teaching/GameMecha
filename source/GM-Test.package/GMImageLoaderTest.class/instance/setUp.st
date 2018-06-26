running
setUp
	self resourceManager: GMImageLoader new.
	super setUp.
	GMTestResourceFixtures createImagesOnDisk.
	
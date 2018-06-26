running
setUp
	self resourceManager: GMResourceLocator imageManager.
	super setUp.
	GMTestResourceFixtures createImagesOnDisk.
	
running
setUp
	self imageManager: GMImageManager instance.
	TestResourceFixtures createImagesOnDisk.
	self imageManager flushCache.
	self assert: [self imageManager cache size == 0].
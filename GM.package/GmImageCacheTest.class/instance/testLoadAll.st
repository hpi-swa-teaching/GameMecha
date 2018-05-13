testing
testLoadAll
	self cache flushCache.
	self assert: [cache imageCache size == 0].
	self cache loadAllImagesFrom: '';
		getImageForm: GmImageCacheTest testImageName asSymbol;
		getImageForm: (GmImageCacheTest testImageName , '2') asSymbol;
		loadAllImagesFrom: ''.
	self assert: [cache imageCache size >= 2].
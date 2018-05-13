testing
testImageLoading
	self prepareTest;
		should: [self cache getImageForm: #GmImageCacheTest testImageName asSymbol] raise: Error.
	self cache loadImageIntoCache: GmImageCacheTest testImageName , '.png' withName: GmImageCacheTest testImageName asSymbol;
		getImageForm: GmImageCacheTest testImageName asSymbol;
		flushCache;
		loadImageIntoCache: GmImageCacheTest testImageName , '.png';
		loadImageIntoCache: GmImageCacheTest testImageName , '.png' withName: GmImageCacheTest testImageName asSymbol.
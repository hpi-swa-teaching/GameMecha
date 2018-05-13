testing
testLoadAll
	self imageManager flushCache.
	self assert: [self imageManager cache size == 0].
	self imageManager loadAllResourcesFrom: '';
		getImageForm: GMImageManagerTest testImageName asSymbol;
		getImageForm: (GMImageManagerTest testImageName , '2') asSymbol;
		loadAllResourcesFrom: ''.
	self assert: [self imageManager cache size >= 2].
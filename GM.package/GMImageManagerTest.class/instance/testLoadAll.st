testing
testLoadAll
	self imageManager flushCache.
	self assert: [self imageManager cache size == 0].
	self imageManager loadAllResourcesWithNamesFrom: '';
		getImageForm: GMImageManagerTest testImageName asSymbol;
		getImageForm: (GMImageManagerTest testImageName , '2') asSymbol;
		loadAllResourcesWithNamesFrom: ''.
	self assert: [self imageManager cache size >= 2].
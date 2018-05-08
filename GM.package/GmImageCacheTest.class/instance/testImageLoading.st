testing
testImageLoading
	self cache flushCache.
	self should: [self cache getImageForm: #patrick] raise: Error.
	self cache loadImageIntoCache: 'patrick.png' withName: #patrick.
	self cache getImageForm: #patrick.
	self cache flushCache.
	self cache loadImageIntoCache: 'patrick.png'.
	self cache loadImageIntoCache: 'patrick.png' withName: #patrick.
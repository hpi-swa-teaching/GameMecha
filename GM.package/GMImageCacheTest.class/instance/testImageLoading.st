testing
testImageLoading
	self cache flushCache.
	self should: [self cache getImageForm: #patrick] raise: Error.
	self cache loadResourceIntoCache: 'patrick.png' withName: #patrick.
	self cache getImageForm: #patrick.
	self cache flushCache.
	self cache loadResourceIntoCache: 'patrick.png'.
	self cache loadResourceIntoCache: 'patrick.png' withName: #patrick.
testing
testImageLoading
	self should: [cache getImageForm: #patrick] raise: Error.
	cache loadImageIntoCache: 'patrick.png'.
	cache getImageForm: #patrick.
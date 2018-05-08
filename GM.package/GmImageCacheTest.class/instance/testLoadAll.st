testing
testLoadAll
	self cache flushCache.
	self assert: [cache imageCache size == 0].
	self cache loadAllImagesFrom: ''.
	self cache getImageForm: #patrick.
	self cache loadAllImagesFrom: ''.
	self assert: [cache imageCache size == 1].
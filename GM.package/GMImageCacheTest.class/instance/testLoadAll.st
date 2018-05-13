testing
testLoadAll
	self cache flushCache.
	self assert: [cache cache size == 0].
	self cache loadAllResourcesFrom: ''.
	self cache getImageForm: #patrick.
	self cache loadAllResourcesFrom: ''.
	self assert: [cache cache size == 2].
test cases
testFlushCache
	self resourceManager cache: ((Dictionary new) at: 'test' put: 'test').
	self resourceManager flushCache.
	self assert: [self resourceManager cache isEmpty].
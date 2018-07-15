as yet unclassified
testFlushCache
	self flag: #todo. "shoulc load something before flushing"
	self resourceManager flushCache.
	self assert: [self resourceManager cache isEmpty].
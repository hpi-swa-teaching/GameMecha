accessing
loadingQueue
	loadingQueue ifNil: [self loadingQueue: OrderedCollection new].
	^ loadingQueue.
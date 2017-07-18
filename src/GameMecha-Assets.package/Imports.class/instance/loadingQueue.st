accessing
loadingQueue
	"all elements are like 'key to load'->Collection<Handler-blocks> "
	"these handlers expect the loaded object as parameter"
	loadingQueue ifNil: [self loadingQueue: OrderedCollection new].
	^ loadingQueue.
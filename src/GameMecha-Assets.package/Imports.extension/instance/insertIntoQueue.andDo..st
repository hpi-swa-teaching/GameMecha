*GameMecha-Assets-Parallel
insertIntoQueue: path andDo: aBlockClosure
	|threadWasRunning|
	threadWasRunning := self isCurrentlyLoading.
	"search for element in queue"
	self loadingQueue do: [:queueElement |
		(queueElement key = path) ifTrue: [queueElement value add: aBlockClosure. ^ self]].
	"not found. Add a new queue element"
	self loadingQueue add: (path -> (OrderedCollection new
		add: aBlockClosure;
		yourself)).
	self addToLoadingFileSize: (self fileSizeOf: path).
	threadWasRunning ifFalse: [self startLoadingThread].
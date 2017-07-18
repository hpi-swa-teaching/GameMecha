*GameMecha-Assets-accessing
loadingLock
	"lock object to manipulate the loading queue"
	loadingLock ifNil: [self loadingLock: Semaphore new].
	^ loadingLock.
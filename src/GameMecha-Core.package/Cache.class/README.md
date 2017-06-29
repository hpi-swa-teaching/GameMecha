A Cache is an Object that "loads elements" only when they are needed, and if they are not loaded yet. It can be used for any kind of Object, like Images, sounds, Levels of you own game etc...

Instance Variables
	cachedElements:		Dictionary
	loadedFileSize:		SmallInteger
	loadingFileSize:		SmallInteger
	loadingLock:		Semaphore
	loadingQueue:		OrderedCollection
	resourceDirectory:		FileDirectory

cachedElements
	- the mapping from generic keys to the objects that are already cached

loadedFileSize
	- accumulated file size of things that got already loaded for the current queue

loadingFileSize
	- accumulated file size of things that need to get loaded for the current queue

loadingLock
	- synchronizing element for accessing the cache

loadingQueue
	- list of (key->(List<handlers>)) - objects, that represents the current queue: which elements should get loaded asynchronous, and what are the handler-blocks that should get executed once this happened?

resourceDirectory
	- root directory for file names

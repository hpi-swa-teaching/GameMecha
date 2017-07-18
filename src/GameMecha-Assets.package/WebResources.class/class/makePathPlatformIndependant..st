as yet unclassified
makePathPlatformIndependant: localPath
	"TODO do not use the cache class here"
	^ (Cache pathToCollection: localPath)
			inject: '.' into: [:accu :next | accu, FileDirectory pathNameDelimiter, next].
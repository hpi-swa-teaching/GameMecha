as yet unclassified
parseDirectory: aDirectory
	"this method splits a path string on common path separator characters
	and converts the resulting collection to a FileDirectory"
	^ (self pathToCollection: aDirectory) inject: (FileDirectory default) into: [:accu :next | accu / next].
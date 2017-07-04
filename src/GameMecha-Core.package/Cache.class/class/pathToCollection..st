as yet unclassified
pathToCollection: aPath
	"split a path at common directory split characters and return the results in a collection"
	(aPath includes: 32 asCharacter) ifTrue: [].
	^ aPath subStrings: '/\'.
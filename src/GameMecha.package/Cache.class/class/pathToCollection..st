as yet unclassified
pathToCollection: aPath
	"split a path at common directory split characters and return the results in a collection"
	^ ((aPath copyWithRegex: '\/' matchesReplacedWith: ' ') copyWithRegex: '\\' matchesReplacedWith: ' ') substrings.
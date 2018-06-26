as yet unclassified
loadResource: anObject intoCacheWithName: aString
	self cache at: aString put: anObject deepCopy.
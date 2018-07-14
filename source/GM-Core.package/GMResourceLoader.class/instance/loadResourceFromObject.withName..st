as yet unclassified
loadResourceFromObject: anObject withName: aString
	self cache at: aString put: anObject deepCopy.
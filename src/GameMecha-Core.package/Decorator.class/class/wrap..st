as yet unclassified
wrap: anObject
	^ (self basicNew)
		wrappedObject: anObject;
		initialize;
		yourself.
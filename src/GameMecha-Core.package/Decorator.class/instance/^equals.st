as yet unclassified
= anotherObject
	^(self == anotherObject) 
		or: [self wrappedObject = anotherObject]
as yet unclassified
doesNotUnderstand: message
	"redirect everything to the wrapped object"
	|result|
	result := self wrappedObject perform: message selector withArguments: message arguments.
	^ (result == self wrappedObject)
		ifTrue: [self]
		ifFalse: [result].
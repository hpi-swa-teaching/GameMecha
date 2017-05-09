as yet unclassified
doesNotUnderstand: message
	"redirect everything to the wrapped object"
	^ self wrappedObject perform: message selector withArguments: message arguments.
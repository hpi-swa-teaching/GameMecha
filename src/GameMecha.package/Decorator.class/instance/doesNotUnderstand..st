as yet unclassified
doesNotUnderstand: message
	"forward everything (that is not overwritten by the decorator) to the wrapped object"
	^ self wrappedObject
		perform: message selector
		withArguments: message arguments.
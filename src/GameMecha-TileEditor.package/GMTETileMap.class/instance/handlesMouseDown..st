event handling
handlesMouseDown: anEvent

	^ (self hasStaticView not) and: [anEvent shiftPressed]
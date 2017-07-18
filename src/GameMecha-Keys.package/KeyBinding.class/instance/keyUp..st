events
keyUp: keyCode
	(self handlesAllEvents or: [self keys includes: keyCode]) 
		ifTrue: [
			self keyUpHandlers do: [:handler | handler value]].
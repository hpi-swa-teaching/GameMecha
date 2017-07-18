events
keyDown: keyCode
	(self handlesAllEvents or: [self keys includes: keyCode]) 
		ifTrue: [
			self keyDownHandlers do: [:handler | handler value]].
events
keyUp: keyCode
	(self keys includes: keyCode) 
		ifTrue: [
			self keyUpHandlers do: [:handler | handler value]].
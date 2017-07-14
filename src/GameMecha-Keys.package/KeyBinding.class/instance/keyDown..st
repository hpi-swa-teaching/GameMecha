events
keyDown: keyCode
	(self keys includes: keyCode) 
		ifTrue: [
			self keyDownHandlers do: [:handler | handler value]].
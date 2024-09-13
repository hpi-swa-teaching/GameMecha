initialization
resetFunctionKeys
	self class registeredMovementKeys do: [:key |
		self gmDeregisterBlockForKey: key].
	self class registeredResizeKeys do: [:key |
		self gmDeregisterMethodInvocationForKey: key].
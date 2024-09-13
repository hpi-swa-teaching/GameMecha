initialization
registerResizeMethods
	"Similar to the registration of blocks we can also register a method and an object on which the method should be called
	for a key. Like for blocks gmEvaluateRegisteredEvents hast to be called to check for pressed keys (see step)."
	self gmRegisterMethodInvocation: #expand on: self 
		forKey: $e.
	self gmRegisterMethodInvocation: #shrink on: self 
		forKey: $q.
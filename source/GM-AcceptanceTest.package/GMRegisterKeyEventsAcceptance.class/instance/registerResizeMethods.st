initialization
registerResizeMethods
	self gmRegisterMethodInvocation: #expand on: self 
		forKey: $e.
	self gmRegisterMethodInvocation: #shrink on: self 
		forKey: $q.
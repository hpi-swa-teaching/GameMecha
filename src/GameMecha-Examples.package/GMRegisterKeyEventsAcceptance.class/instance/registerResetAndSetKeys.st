initialization
registerResetAndSetKeys
	self gmRegisterBlock: [self registerMovementBlocks. self registerResizeMethods] 
		forKey: $s.
	self gmRegisterMethodInvocation: #resetFunctionKeys on: self 
		forKey: $r.
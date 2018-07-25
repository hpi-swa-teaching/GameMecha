initialization
registerMovementBlocks
	self gmRegisterBlock: [self position: self position + (self class speed negated @ 0)] 
		forKey: Character arrowLeft.
	self gmRegisterBlock: [self position: self position + (self class speed @ 0)] 
		forKey: Character arrowRight.
	self gmRegisterBlock: [self position: self position + (0 @ self class speed negated)] 
		forKey: Character arrowUp .
	self gmRegisterBlock: [self position: self position + (0 @ self class speed)] 
		forKey: Character arrowDown.
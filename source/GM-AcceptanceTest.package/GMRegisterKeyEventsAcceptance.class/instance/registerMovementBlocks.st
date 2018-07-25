initialization
registerMovementBlocks
	"We can register blocks which should be executed every time
	gmEvaluateRegisteredEvents is sent and the key for which the block is registered is pressed.
	See step for more details."
	self gmRegisterBlock: [self position: self position + (self class speed negated @ 0)] 
		forKey: Character arrowLeft.
	self gmRegisterBlock: [self position: self position + (self class speed @ 0)] 
		forKey: Character arrowRight.
	self gmRegisterBlock: [self position: self position + (0 @ self class speed negated)] 
		forKey: Character arrowUp .
	self gmRegisterBlock: [self position: self position + (0 @ self class speed)] 
		forKey: Character arrowDown.
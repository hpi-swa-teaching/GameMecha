initialization
initialize
	super initialize.
	self extent: self class extent.
	self color: Color gray.
	self addMorph: self stringMorph.
	"First of all, we need to specify that this Morph should listen to keyboard input.
	We use our GMKeyHandler (gmRegisterToKeyHandler), because it is plattorm independent."
	self gmRegisterToKeyHandler.
	self gmRegisterKeyEvent: [self position: self position + (self class speed negated @ 0)] forKey: Character arrowLeft.
	self gmRegisterKeyEvent: [self position: self position + (self class speed @ 0)] forKey: Character arrowRight.
	self gmRegisterKeyEvent: [self position: self position + (0 @ self class speed negated)] forKey: Character arrowUp .
	self gmRegisterKeyEvent: [self position: self position + (0 @ self class speed)] forKey: Character arrowDown.
	self gmRegisterMethodInvocation: #expand on: self  forKey: $e.
	self gmRegisterMethodInvocation: #shrink on: self  forKey: $q.
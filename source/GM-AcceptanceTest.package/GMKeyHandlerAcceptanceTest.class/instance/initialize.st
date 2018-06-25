initialization
initialize
	super initialize.
	"First of all, we need to specify that this Morph should listen to keyboard input.
	We use our GMKeyHandler (gmRegisterToKeyHandler), because it is plattorm independent."
	self gmRegisterToKeyHandler.
	self registerKeyEvent: [self extent: self extent * 1.1] forKey: $s.
	self gmRegisterMethodInvocation: #move on: self  forKey: $m.
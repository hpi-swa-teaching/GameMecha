initialization
initialize
	super initialize.
	"First of all, we need to specify that this Morph should listen to keyboard input.
	We use our GMKeyHandler (gmRegisterToKeyHandler), because it is plattorm independent."
	self gmRegisterToKeyHandler.
	self registerKeyEvent: [Transcript show: 'a'] forKey: $s.
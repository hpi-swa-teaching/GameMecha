initialization
initialize
	super initialize.
	self extent: GMRegisterKeyEventsAcceptanceTest extent.
	self color: Color gray.
	self addMorph: self stringMorph.
	"First of all, we need to specify that this Morph should listen to keyboard input.
	We use our GMKeyHandler (gmRegisterToKeyHandler), because it is plattorm independent."
	self registerToKeyHandler.
	self registerKeyEvent: [self position: self position + (GMRegisterKeyEventsAcceptanceTest speed negated @ 0)] forKey: Character arrowLeft.
	self registerKeyEvent: [self position: self position + (GMRegisterKeyEventsAcceptanceTest speed @ 0)] forKey: Character arrowRight.
	self registerKeyEvent: [self position: self position + (0 @ GMRegisterKeyEventsAcceptanceTest speed negated)] forKey: Character arrowUp .
	self registerKeyEvent: [self position: self position + (0 @ GMRegisterKeyEventsAcceptanceTest speed)] forKey: Character arrowDown.
	self registerMethodInvocation: #expand on: self  forKey: $e.
	self registerMethodInvocation: #shrink on: self  forKey: $q.
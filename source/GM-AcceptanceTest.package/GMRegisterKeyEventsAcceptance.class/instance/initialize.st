initialization
initialize
	super initialize.
	self flag: #maybebrokenInMerge.
	self extent: GMRegisterKeyEventsAcceptance extent.
	self color: Color gray.
	self addMorph: self stringMorph.
	"First of all, we need to specify that this Morph should listen to keyboard input.
	We use our GMKeyHandler (gmRegisterToKeyHandler), because it is plattorm independent."
	self gmRegisterToKeyHandler.
	"Now we can register blocks which should be executed every time
	gmEvaluateRegisteredEvents is sent and the key for which the block is registered is pressed.
	See step for more details."
	self gmRegisterKeyEvent: [self position: self position + (GMRegisterKeyEventsAcceptance speed negated @ 0)] forKey: Character arrowLeft.
	self gmRegisterKeyEvent: [self position: self position + (GMRegisterKeyEventsAcceptance speed @ 0)] forKey: Character arrowRight.
	self gmRegisterKeyEvent: [self position: self position + (0 @ GMRegisterKeyEventsAcceptance speed negated)] forKey: Character arrowUp .
	self gmRegisterKeyEvent: [self position: self position + (0 @ GMRegisterKeyEventsAcceptance speed)] forKey: Character arrowDown.
	"Similar to the registration of block we can also register a method and an object on which the method should be called
	for a key. Like for blocks gmEvaluateRegisteredEvents hast to be called to check for pressed keys (see step)."
	self gmRegisterMethodInvocation: #expand on: self  forKey: $e.
	self gmRegisterMethodInvocation: #shrink on: self  forKey: $q.

	"Attention: Every time you register a new block for a key the previously registered block gets unregistered.
	Likewise every time you register a new method for a key the previously registered method gets unregistered.
	So if you want to unregister a block (for example for key 'e') just call
	self gmRegisterKeyEvent: [] forKey: $e. or to unregister a method call
	self gmRegisterMethodInvocation: #yourself on: self forKey: $e."

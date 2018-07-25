initialization
initialize
	super initialize.
	self extent: self class extent.
	self color: Color gray.
	self addMorph: self createStringMorph.
	"First of all, we need to specify that this Morph should listen to keyboard input.
	We use our GMKeyHandler (gmRegisterToKeyHandler), because it is plattorm independent."
	self gmRegisterToKeyHandler.
	"Now we can register blocks which should be executed every time
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
	"You can also deregister previously registered block. To demonstrate this we make a useless registration."
	self gmRegisterBlock: [self position: self position + (0 @ self class speed)] 
		forKey: $s.
	"Now we can deregister it."
	self gmDeregisterBlockForKey: $s.
	"Similar to the registration of block we can also register a method and an object on which the method should be called
	for a key. Like for blocks gmEvaluateRegisteredEvents hast to be called to check for pressed keys (see step)."
	self gmRegisterMethodInvocation: #expand on: self 
		forKey: $e.
	self gmRegisterMethodInvocation: #shrink on: self 
		forKey: $q.
	"You can deregister Methods the same way you deregister Blocks. To demonstrate this we again make a useless registration."
	self gmRegisterMethodInvocation: #shrink on: self 
		forKey: $w.
	"Now we can deregister it."
	self gmDeregisterMethodInvocationForKey: $w.

	"Attention: Every time you register a new block for a key the previously registered block gets unregistered.
	Likewise, every time you register a new method for a key the previously registered method gets unregistered."

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
	self registerMovementBlocks.
	"Similar to the registration of block we can also register a method and an object on which the method should be called
	for a key. Like for blocks gmEvaluateRegisteredEvents hast to be called to check for pressed keys (see step)."
	self registerResizeMethods.
	
	"Blocks and methods can also be deregistered(see resetFunctionKeys)"
	self registerResetAndSetKeys.

	"Attention: Every time you register a new block for a key the previously registered block gets unregistered.
	Likewise, every time you register a new method for a key the previously registered method gets unregistered."

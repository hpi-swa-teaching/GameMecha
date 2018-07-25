initialization
initialize
	super initialize.
	self extent: self class extent.
	self color: Color gray.
	self addMorph: self createStringMorph.
	"First of all, we need to specify that this Morph should listen to keyboard input.
	We use our GMKeyHandler (gmRegisterToKeyHandler), because it is plattorm independent."
	self gmRegisterToKeyHandler.
	
	"Now we can register events to keys. Browse the code of the following two methods to learn
	how to register events for keys using our GMKeyHandler."
	self registerMovementBlocks.
	self registerResizeMethods.
	
	"Blocks and methods can also be deregistered(see resetFunctionKeys)"
	self registerResetAndSetKeys.

	"Attention: Every time you register a new block for a key the previously registered block gets unregistered.
	Likewise, every time you register a new method for a key the previously registered method gets unregistered."
initialization
initialize
	super initialize.
	"First of all, we need to specify that this Morph should listen to keyboard input.
	We use our GMKeyHandler (gmRegisterToKeyHandler), because it is plattorm independent.
	Look inside the step method of GMKeyHandlerAcceptanceTestKeyMorph for further information."
	self
		registerToKeyHandler;
		initializeKeyMorphs;
		enforceLayout.
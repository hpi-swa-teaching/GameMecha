initialization
initialize
	super initialize.
	self extent: self class gameSize;
		color: Color white.
	"The surrounding level Morph has to register to the keyhandler as it will have the mouse focus."
	self gmRegisterToKeyHandler.
	self initializePlanets.
	self spawnPlayer1.
	self spawnPlayer2.
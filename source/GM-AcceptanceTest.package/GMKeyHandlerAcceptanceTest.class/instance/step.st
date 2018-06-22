stepping and presenter
step
	"First possible usage of the keyHandling, ask for pressed keys:
	After we register the GMKeyHandler with gmRegisterToKeyHandler (see initialize), we are now able to ask whether a specific key
	(specified by his ASCII character) is pressed. If the y-key is pressed, we change our color to get a nice visual feedback.
	See a list of all supported keys in package GM-Keys in class GMKeyHandler on the class side in one of the initializeKeyLookup 
	functions (the values of the dictionary are the supported characters; the keys are only for plattform independence)."
	(self isKeyPressed: $y) ifTrue: [self color: Color random].
	"Second possible use of the keyHandling features, evaluate registered blocks for pressed keys:
	Everytimes evaluateRegisteredEvents is send to a Morph which has a GMKeyHandler registered 
	(see call gmRegisterToKeyHandler in initialize) all registered blocks of all the keys which are pressed at the moment are executed.
	Becaus we registered block which expands our Morph to the $s key (see initialize), everytime when the step function is called our
	Morph gets bigger." 
	self evaluateRegisteredEvents.
	
stepping and presenter
step
	"Second possible use of the keyHandling features, evaluate registered blocks for pressed keys:
	Everytimes evaluateRegisteredEvents is send to a Morph which has a GMKeyHandler registered 
	(see call gmRegisterToKeyHandler in initialize) all registered blocks of all the keys which are pressed at the moment are executed.
	Becaus we registered block which expands our Morph to the $s key (see initialize), everytime when the step function is called our
	Morph gets bigger." 
	self evaluateRegisteredEvents.
	
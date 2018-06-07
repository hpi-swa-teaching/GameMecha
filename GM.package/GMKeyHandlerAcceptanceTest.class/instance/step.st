stepping and presenter
step
	"After we register the GMKeyHandler  with gmRegisterToKeyHandler (see initialize ) we are now able to ask whether a specific key
	(specified by his ASCII character) is pressed. Is the y-key is pressed we change our color to get a nice visual feedback."
	"See a list of all supported keys in package GM-Keys in class GMKeyHandler on the class side in one of the initializeKeyLookup 
	functions (the values of the dictionary are the supported characters the keys are only for plattform independence)."
	(self isKeyPressed: $y) ifTrue: [self color: Color random].
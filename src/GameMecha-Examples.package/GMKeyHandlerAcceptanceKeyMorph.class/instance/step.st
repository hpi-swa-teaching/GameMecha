stepping and presenter
step
	"Because we previously registered a GMKeyHandler for this Morph we can now ask whether a specific key
	(given by its ASCII key character) is pressed. To see a list of all supported characters use 
	'GMKeyHandlerAcceptanceTest new openInWorld' or if you only accept code as single source of truth
	look at the initilizeKeyLookupXXX methods on class side of GMKeyHandler."
	(self gmIsKeyPressed: self listenToKey) 
		ifTrue: [self color: Color gray]
		ifFalse: [self color: Color white].
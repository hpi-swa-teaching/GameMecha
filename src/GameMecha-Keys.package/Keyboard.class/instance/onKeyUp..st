event input
onKeyUp: aKeyboardEvent
	"passed through by the main morph"
	| keyCode |
	keyCode := (self prepreprocessChar: aKeyboardEvent keyCharacter).
	
	"mark key as released"
	self pressedKeys remove: keyCode ifAbsent: [].

	"run key up handlers"
	self keyUpHandlers at: keyCode ifPresent: [:handler | handler value].
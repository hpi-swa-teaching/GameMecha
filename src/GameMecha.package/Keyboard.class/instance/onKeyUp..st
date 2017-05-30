event input
onKeyUp: aKeyboardEvent
	"passed through by the main morph"
	| key |
	key := aKeyboardEvent keyCharacter asUppercase.
	
	self pressedKeys remove: key asciiValue ifAbsent: [].

	"run key up handlers"
	self keyUpHandlers at: key ifPresent: [:handler | handler value].
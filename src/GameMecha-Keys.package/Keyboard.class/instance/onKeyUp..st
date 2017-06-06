event input
onKeyUp: aKeyboardEvent
	"passed through by the main morph"
	| keyCode |
	keyCode := (self preprocessChar: aKeyboardEvent keyCharacter).
	
	self pressedKeys remove: keyCode ifAbsent: [].

	"run key up handlers"
	self keyUpHandlers at: keyCode ifPresent: [:handler | handler value].
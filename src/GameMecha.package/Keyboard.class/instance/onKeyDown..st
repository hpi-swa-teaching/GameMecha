event input
onKeyDown: aKeyboardEvent
	"passed through by the main morph"
	| keyCode |
	keyCode := (self prepreprocessChar: aKeyboardEvent keyCharacter).
	
	"mark key as pressed"
	self pressedKeys add: keyCode.
	
	"run keydown handler(s)"
	self keyDownHandlers at: keyCode ifPresent: [:handler | handler value].
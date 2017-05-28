event input
onKeyDown: aKeyboardEvent
	"passed through by the main morph"
	| key |
	key := aKeyboardEvent keyCharacter asUppercase.
	
	"mark key as pressed"
	self pressedKeys add: key asciiValue.
	
	"run keydown handler(s)"
	self keyDownHandlers at: key asciiValue ifPresent: [:handler | handler value].
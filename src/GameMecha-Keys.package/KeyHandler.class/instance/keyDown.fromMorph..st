event input
keyDown: aKeyboardEvent fromMorph: aMorph
	"passed through by the main morph"
	| keyCode |
	keyCode := self preprocessEvent: aKeyboardEvent.
	
	Transcript showln: keyCode asString, '(was ', aKeyboardEvent keyValue asString ,')'.
	
	"mark key as pressed"
	self pressedKeys add: keyCode.
	
	"run keydown handler(s)"
	self keyDownHandlers at: keyCode ifPresent: [:handler | handler value].
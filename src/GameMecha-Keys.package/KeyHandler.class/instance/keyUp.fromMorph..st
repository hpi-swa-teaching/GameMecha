event input
keyUp: aKeyboardEvent fromMorph: aMorph
	"passed through by the main morph"
	| keyCode |
	keyCode := self preprocessEvent: aKeyboardEvent.
	
	"mark key as released"
	self pressedKeys remove: keyCode ifAbsent: [].

	"run key up handlers"
	self keyUpHandlers at: keyCode ifPresent: [:handler | handler value].
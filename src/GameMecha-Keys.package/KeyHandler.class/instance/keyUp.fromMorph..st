event input
keyUp: aKeyboardEvent fromMorph: aMorph
	"passed through by the main morph"
	| keyCode |
	keyCode := self preprocessEvent: aKeyboardEvent.
	"mark key as released"
	self pressedKeys remove: keyCode ifAbsent: [].
	"send event to all bindings"
	self bindings do: [:binding | binding keyUp: keyCode].
event input
keyDown: aKeyboardEvent fromMorph: aMorph
	"passed through by the main morph"
	| keyCode |
	keyCode := self preprocessEvent: aKeyboardEvent.	
	"invoke keyEvent handlers"
	self eventHandler do: [:handler | handler value: keyCode].	
	"mark key as pressed"
	self pressedKeys add: keyCode.
	"send event to all bindings"
	self bindings do: [:binding | binding keyDown: keyCode].
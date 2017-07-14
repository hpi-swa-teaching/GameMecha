*GameMecha-Keys
registerKeyboardBindings: aKeyHandler
	self extension eventHandler: aKeyHandler. 
	ActiveHand newKeyboardFocus: self.
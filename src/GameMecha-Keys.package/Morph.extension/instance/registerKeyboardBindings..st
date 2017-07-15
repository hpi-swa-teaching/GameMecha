*GameMecha-Keys
registerKeyboardBindings: aKeyHandler
	self assureExtension.
	self extension eventHandler: aKeyHandler. 
	ActiveHand newKeyboardFocus: self.
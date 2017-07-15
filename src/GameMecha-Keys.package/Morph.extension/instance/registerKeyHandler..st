*GameMecha-Keys
registerKeyHandler: aKeyHandler
	self assureExtension.
	self extension eventHandler: aKeyHandler. 
	ActiveHand newKeyboardFocus: self.
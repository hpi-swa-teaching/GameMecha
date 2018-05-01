*Gm-Keys
gmRegisterToKeyHandler
	self assureExtension.
	self extension eventHandler: GmKeyHandler new.
	ActiveHand newKeyboardFocus: self.
	
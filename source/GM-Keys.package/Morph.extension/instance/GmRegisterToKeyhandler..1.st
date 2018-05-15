*Gm-Keys
GmRegisterToKeyhandler
	self assureExtension.
	self extension eventHandler: GMKeyHandler new.
	ActiveHand newKeyboardFocus: self.
	
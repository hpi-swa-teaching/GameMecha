*Gm-Keys
GmRegisterToKeyhandler
	self assureExtension.
	self extension eventHandler: GmKeyHandler new.
	ActiveHand newKeyboardFocus: self.
	
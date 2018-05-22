*GM-Keys
gmRegisterToKeyHandler
    self assureExtension.
    self extension eventHandler: GMKeyHandler new.
    ActiveHand newKeyboardFocus: self.
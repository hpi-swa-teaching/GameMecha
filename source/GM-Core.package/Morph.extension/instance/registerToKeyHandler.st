*GM-Core
registerToKeyHandler
    self assureExtension.
    self extension eventHandler: (GMKeyHandler new).
    ActiveHand newKeyboardFocus: self.
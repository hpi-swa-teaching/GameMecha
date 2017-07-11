keyHandling
initialize
	self keyDownHandlers: Dictionary new.
	self keyUpHandlers: Dictionary new.
	self pressedKeys: Set new.
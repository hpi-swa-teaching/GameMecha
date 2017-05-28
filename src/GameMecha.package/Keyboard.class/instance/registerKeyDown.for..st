handler registration
registerKeyDown: aHandler for: aCharacter
	self register: aHandler for: aCharacter at: self keyDownHandlers.
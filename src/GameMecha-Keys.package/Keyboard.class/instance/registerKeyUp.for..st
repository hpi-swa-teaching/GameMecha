handler registration
registerKeyUp: aHandler for: aCharacter
	self register: aHandler for: aCharacter at: self keyUpHandlers.
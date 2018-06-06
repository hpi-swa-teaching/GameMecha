event Input
keyUp: aKeyboardEvent fromMorph: aMorph
	self pressedKeys remove: ((self class KeyLookup) at: aKeyboardEvent keyValue ifAbsent: []) ifAbsent: [].
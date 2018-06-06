event Input
keyDown: aKeyboardEvent fromMorph: aMorph
	self pressedKeys add: (self class KeyLookup at: aKeyboardEvent keyValue ifAbsent: []).
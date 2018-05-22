event Input
keyDown: aKeyboardEvent fromMorph: aMorph
	self keyPressedLookup at: (self class KeyLookup at: aKeyboardEvent keyValue ifAbsent: []) put: true.
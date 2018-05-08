event Input
keyDown: aKeyboardEvent fromMorph: aMorph
	self keyPressedLookup at: (self class keyLookup at: aKeyboardEvent keyValue ifAbsent: []) put: true.
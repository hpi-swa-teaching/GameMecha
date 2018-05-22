event Input
keyUp: aKeyboardEvent fromMorph: aMorph
	self keyPressedLookup at: ((self class KeyLookup) at: aKeyboardEvent keyValue ifAbsent: [nil]) put: false.
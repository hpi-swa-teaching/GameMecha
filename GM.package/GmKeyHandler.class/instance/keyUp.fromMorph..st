event Input
keyUp: aKeyboardEvent fromMorph: aMorph
	self keyPressedLookup at: ((self class keyLookup) at: aKeyboardEvent keyValue ifAbsent: [nil]) put: false.
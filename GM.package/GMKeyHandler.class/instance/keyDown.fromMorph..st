event Input
keyDown: aKeyboardEvent fromMorph: aMorph
	self pressedKeys add: (self class keyLookup at: aKeyboardEvent keyValue ifAbsent: []).
	self flag: #todo. "isPresent"
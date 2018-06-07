event Input
keyUp: aKeyboardEvent fromMorph: aMorph
	self pressedKeys remove: ((self class keyLookup) at: aKeyboardEvent keyValue ifAbsent: []) ifAbsent: [].
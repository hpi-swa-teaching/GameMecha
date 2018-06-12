event Input
keyDown: aKeyboardEvent fromMorph: aMorph
	self class keyLookup at: aKeyboardEvent keyValue ifPresent: [:key | self pressedKeys add: key].
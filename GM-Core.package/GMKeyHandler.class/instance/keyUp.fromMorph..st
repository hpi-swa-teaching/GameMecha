event Input
keyUp: aKeyboardEvent fromMorph: aMorph
	(self class keyLookup) at: aKeyboardEvent keyValue ifPresent: [:key | self pressedKeys remove: key ifAbsent: []].
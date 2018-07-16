event handling
keyDown: anEvent fromMorph: aMorph
	self class keyLookup at: anEvent keyValue ifPresent: [:key | self pressedKeys add: key].
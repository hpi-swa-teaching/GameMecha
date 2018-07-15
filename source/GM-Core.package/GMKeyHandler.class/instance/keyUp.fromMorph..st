event Input
keyUp: anEvent fromMorph: aMorph
	(self class keyLookup) at: anEvent keyValue ifPresent: [:key | 
		self pressedKeys remove: key ifAbsent: []].
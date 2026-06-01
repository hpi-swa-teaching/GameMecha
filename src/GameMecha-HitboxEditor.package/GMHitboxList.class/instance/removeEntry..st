adding/removing
removeEntry: anEntry

	self entryBag remove: anEntry.
	self removeMorph: anEntry. 
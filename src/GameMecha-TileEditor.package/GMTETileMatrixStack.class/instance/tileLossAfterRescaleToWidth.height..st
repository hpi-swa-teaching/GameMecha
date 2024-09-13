updating
tileLossAfterRescaleToWidth: aWidth height: aHeight

	| removedTiles |
	removedTiles := Dictionary new.
	
	self doLayersWithIds: [:layer :id |
		removedTiles addAll: (layer tileLossAfterRescaleToWidth: aWidth height: aHeight layerId: id)].
	
	^ removedTiles
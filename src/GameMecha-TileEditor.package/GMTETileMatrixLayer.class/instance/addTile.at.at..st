adding
addTile: aTile at: y at: x

	(aTile isNil not and: [self inBounds: x@y]) ifTrue: [
		aTile morphicLayerNumber: self layerIndex.
		aTile visible: self visible].
	^ self at: y at: x put: aTile
	


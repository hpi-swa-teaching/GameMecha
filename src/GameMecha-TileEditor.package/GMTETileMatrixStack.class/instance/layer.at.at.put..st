accessing
layer: aLayerIndex at: y at: x put: aTile
	
	^ (self matrixLayers at: aLayerIndex) addTile: aTile at: y at: x
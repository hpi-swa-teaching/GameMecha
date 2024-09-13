removing
removeLayerAt: index 

	| removedLayer |.
	self assert: self matrixLayers size > 1 description: 'Base layer cannot be removed!'.
	
	removedLayer := (self matrixLayers removeAt: index) value.
	removedLayer free
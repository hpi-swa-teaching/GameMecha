removing
removeLayersAt: aSet

	self mapLayers: (self sortLayerSet: aSet) withUnaryBlock: [:layerIndex |
		self removeLayerAt: layerIndex]
	
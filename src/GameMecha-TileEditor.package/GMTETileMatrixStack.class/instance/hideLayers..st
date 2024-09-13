updating
hideLayers: aSet

	self mapLayers: (self sortLayerSet: aSet) withUnaryBlock: [:layerIndex |
		self hideLayer: layerIndex]
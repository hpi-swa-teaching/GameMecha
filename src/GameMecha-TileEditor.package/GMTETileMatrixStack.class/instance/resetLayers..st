removing
resetLayers: aSet

	self mapLayers: (self sortLayerSet: aSet) withUnaryBlock: [:layerIndex |
		self resetLayer: layerIndex]
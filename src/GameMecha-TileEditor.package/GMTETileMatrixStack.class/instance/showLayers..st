updating
showLayers: aSet

	self mapLayers: (self sortLayerSet: aSet) withUnaryBlock: [:layerIndex |
		self showLayer: layerIndex]
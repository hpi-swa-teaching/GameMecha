updating
blendLayers: aSet

	self reduceLayers: (self sortLayerSet: aSet) withBinaryBlock: [:anIndex1 :anIndex2 | 
		self blendLayer: anIndex1 with: anIndex2]
updating
swapLayer: anIndex1 with: anIndex2

	| tmpMorhpicLayer layer1 layer2 |
	layer1 := self layer: anIndex1.
	layer2 := self layer: anIndex2.
	tmpMorhpicLayer := layer1 layerIndex.
	
	layer1 updateLayerTo: layer2 layerIndex.
	layer2 updateLayerTo: tmpMorhpicLayer.

	self matrixLayers swap: anIndex1 with: anIndex2
	
eumerating
doLayersWithIds: aBlock
	
	| layerNumber |
	layerNumber := self matrixLayers size.
	(1 to: layerNumber) do: [:i | aBlock value: (self matrixLayers at: i) value: i]
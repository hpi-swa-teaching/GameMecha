layer manipulation
addTilemapLayersAt: aLayerList

	| newLayerNumber |
	(self layerCount >= GMTETileMap maxLayers) ifTrue: [^ nil].
	newLayerNumber :=  self layerCount + 1.
	
	self tileMap tileMatrixStack pushLayers: aLayerList.
	self 
		selectOnlyLayer: aLayerList last;
		changed: #getLayerList
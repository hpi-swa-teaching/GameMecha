layer manipulation
deleteTilemapLayers: aLayerList
	
	self tileMap tileMatrixStack removeLayersAt: aLayerList.
	self 
		deselectAllLayers;
		changed: #getLayerList;
		selectOnlyLayer: self layerCount
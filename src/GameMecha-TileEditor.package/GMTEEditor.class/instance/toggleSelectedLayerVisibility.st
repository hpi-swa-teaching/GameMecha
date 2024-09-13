layer manipulation
toggleSelectedLayerVisibility
	
	self selectedLayers do: [:i |self tileMap tileMatrixStack toggleLayerVisibility: i].
	self changed: #getLayerList
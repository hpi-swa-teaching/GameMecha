layer manipulation
addLayer
	
	(self layerCount >= GMTETileMap maxLayers) ifTrue: [^ nil].
	self
		addCommand: (GMTEAddLayerCommand withEditor: self);
		addTilemapLayer
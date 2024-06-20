as yet unclassified
testMoveLayerDown

	| TileMatrixStack layer1 layerId1 layerId2 |
	
	TileMatrixStack:= self editor tileMap tileMatrixStack.
	self editor addLayer.
	layer1 := TileMatrixStack matrixLayers at: 1.
	layerId1 := (TileMatrixStack matrixLayers at: 1) layerIdx.
	layerId2 := (TileMatrixStack matrixLayers at: 2) layerIdx.	
	self editor selectedLayer: 1.
	self editor moveLayerDown.
	self assert: (TileMatrixStack matrixLayers at: 1) layerIdx = layerId1.
	self assert: (TileMatrixStack matrixLayers at: 2) layerIdx = layerId2.
	self assert: (TileMatrixStack matrixLayers at: 2) == layer1.
	self assert: ((TileMatrixStack matrixLayers at: 1) == layer1) not
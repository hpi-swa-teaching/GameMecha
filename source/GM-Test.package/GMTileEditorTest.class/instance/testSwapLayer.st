layerTests
testSwapLayer
	"tests the swapping of two layers"
	
	| TileMatrixStack layer1 layerId1 layerId2 |
	TileMatrixStack:= self editor tileMap tileMatrixStack.
	self editor addLayer.
	layer1 := TileMatrixStack matrixLayers at: 1.
	layerId1 := (TileMatrixStack matrixLayers at: 1) layerIndex.
	layerId2 := (TileMatrixStack matrixLayers at: 2) layerIndex.	
	TileMatrixStack swapLayer: 1 with: 2.
	self assert: (TileMatrixStack matrixLayers at: 1) layerIndex = layerId1.
	self assert: (TileMatrixStack matrixLayers at: 2) layerIndex = layerId2.
	self assert: (TileMatrixStack matrixLayers at: 2) == layer1.
	self assert: ((TileMatrixStack matrixLayers at: 1) == layer1) not
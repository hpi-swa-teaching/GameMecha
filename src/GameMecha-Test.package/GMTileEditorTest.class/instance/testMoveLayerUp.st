layerTests
testMoveLayerUp
	"tests the moveLayerUp function"
	
	| tileMatrixStack layer1 layerId1 layerId2 |
	tileMatrixStack:= self editor tileMap tileMatrixStack.
	self editor addLayer.
	layer1 := tileMatrixStack matrixLayers at: 1.
	layerId1 := (tileMatrixStack matrixLayers at: 1) layerIndex.
	layerId2 := (tileMatrixStack matrixLayers at: 2) layerIndex.	
	self editor selectOnlyLayer: 1.
	self editor moveLayerUp.
	self assert: (tileMatrixStack matrixLayers at: 1) layerIndex = layerId1.
	self assert: (tileMatrixStack matrixLayers at: 2) layerIndex = layerId2.
	self assert: (tileMatrixStack matrixLayers at: 2) == layer1.
	self assert: ((tileMatrixStack matrixLayers at: 1) == layer1) not
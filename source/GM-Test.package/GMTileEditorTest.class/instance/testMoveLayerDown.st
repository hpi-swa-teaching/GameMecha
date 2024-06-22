as yet unclassified
testMoveLayerDown
	"tests the moveLayerDown function"
	
	| tileMatrixStack layer1 layerId1 layerId2 |
	tileMatrixStack:= self editor tileMap tileMatrixStack.
	self editor addLayer.
	layer1 := tileMatrixStack matrixLayers at: 1.
	layerId1 := (tileMatrixStack matrixLayers at: 1) layerIdx.
	layerId2 := (tileMatrixStack matrixLayers at: 2) layerIdx.	
	self editor moveLayerDown.
	self assert: (tileMatrixStack matrixLayers at: 1) layerIdx = layerId1.
	self assert: (tileMatrixStack matrixLayers at: 2) layerIdx = layerId2.
	self assert: (tileMatrixStack matrixLayers at: 2) == layer1.
	self assert: ((tileMatrixStack matrixLayers at: 1) == layer1) not
as yet unclassified
testMultiToggleLayerVisibility

	self editor addLayer.
	self editor selectLayer: 1.
	self editor toggleSelectedLayerVisibility.
	self assert: (self editor tileMap tileMatrixStack layer: 1) visible = false.
	self assert: (self editor tileMap tileMatrixStack layer: 2) visible = false.
	self editor toggleSelectedLayerVisibility.
	self assert: (self editor tileMap tileMatrixStack layer: 1) visible = true.
	self assert: (self editor tileMap tileMatrixStack layer: 2) visible = true
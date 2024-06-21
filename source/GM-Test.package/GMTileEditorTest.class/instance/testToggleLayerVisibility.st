as yet unclassified
testToggleLayerVisibility
	
	self editor toggleSelectedLayerVisibility.
	self assert: (self editor tileMap tileMatrixStack layer: 1) visible = false.
	self editor toggleSelectedLayerVisibility.
	self assert: (self editor tileMap tileMatrixStack layer: 1) visible = true
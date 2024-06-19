as yet unclassified
testToggleLayerVisibility
	
	self editor toggleLayerVisibility.
	self assert: (self editor tileMapMatrix tileMatrixStack layer: 1) visible = false.
	self editor toggleLayerVisibility.
	self assert: (self editor tileMapMatrix tileMatrixStack layer: 1) visible = true.
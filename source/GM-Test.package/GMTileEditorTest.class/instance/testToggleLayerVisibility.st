as yet unclassified
testToggleLayerVisibility
	
	self editor toggleLayerVisibility.
	self assert: (self editor tileMap tileMatrixStack layer: 1) visible = false.
	self editor toggleLayerVisibility.
	self assert: (self editor tileMap tileMatrixStack layer: 1) visible = true.
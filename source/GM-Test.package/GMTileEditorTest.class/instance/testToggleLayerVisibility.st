layerTests
testToggleLayerVisibility
	"tests the visibility toggle for one selected layer"
	
	self editor toggleSelectedLayerVisibility.
	self assert: (self editor tileMap tileMatrixStack layer: 1) visible = false.
	self editor toggleSelectedLayerVisibility.
	self assert: (self editor tileMap tileMatrixStack layer: 1) visible = true
layerTests
testToggleHighlightingLayer
	"tests the visibility toggle for the visual layer"
	
	self editor toggleGrid.
	self assert: (self editor tileMap tileMatrixStackHighlighting layer: 1) visible = false.
	self editor toggleGrid.
	self assert: (self editor tileMap tileMatrixStackHighlighting layer: 1) visible = true
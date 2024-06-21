as yet unclassified
testToggleVisualLayer
	
	self editor toggleGrid.
	self assert: (self editor tileMap tileMatrixStackHighlighting layer: 1) visible = false.
	self editor toggleGrid.
	self assert: (self editor tileMap tileMatrixStackHighlighting layer: 1) visible = true.
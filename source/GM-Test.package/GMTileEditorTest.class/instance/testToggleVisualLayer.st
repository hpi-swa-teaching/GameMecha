as yet unclassified
testToggleVisualLayer
	self editor ifNil:
		[self setup].
	self editor tileMapMatrix disableVisualLayer.
	self assert: (((self editor tileMapMatrix tileMatrixStackVisual matrixLayers at: 1) at: 1 at: 1) borderColor) = Color transparent.
	self editor tileMapMatrix enableVisualLayer.
	self assert: (((self editor tileMapMatrix tileMatrixStackVisual matrixLayers at: 1) at: 1 at: 1) borderColor) = Color white.
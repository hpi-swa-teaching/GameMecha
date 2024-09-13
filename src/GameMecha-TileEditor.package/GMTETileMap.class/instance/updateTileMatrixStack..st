updating
updateTileMatrixStack: aStack
	"Convenience method for editable & highlighting matrix stack"

	self updateTileMatrixStack: aStack posCorrectionBlock: [:aPoint | 
		self correctedTilePositionMap: aPoint]
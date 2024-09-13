updating
updateMap
	"Update map by: fitting grid to current screen, generating tile matrix, adding sprites"
	
	self areDimensionsSet ifFalse: [^ nil].
	
	self updateDimensions.
	self tileMatrixStack 
		ifNil: [self generateMatrixStacks]
		ifNotNil: [self updateTiles]
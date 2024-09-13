updating
updateTilesBackground
	"Background tiles are handled seperately, because they are only updated if they're visible for performance reasons"
	
	(self tileMatrixStackBackground visible not) ifTrue: [^ nil].

	self tileMatrixStackBackground 
		rescaleToWidth: self tileWidth height: self tileHeight;
		reset. 
	self 
		generateBackgroundTiles;
		updateTileMatrixStack: self tileMatrixStackBackground posCorrectionBlock: [:aPoint | 
		self correctedTilePositionBackground: aPoint]
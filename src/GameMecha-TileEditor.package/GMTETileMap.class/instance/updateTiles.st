updating
updateTiles
	"Collectively update all matrix stacks and therefore all tiles contained within"
	"Note: Rescaling is not very performant"
	
	self 
		updateTilesBackground;
		updateTileMatrixStack: self tileMatrixStack;
		updateTileMatrixStack: self tileMatrixStackHighlighting
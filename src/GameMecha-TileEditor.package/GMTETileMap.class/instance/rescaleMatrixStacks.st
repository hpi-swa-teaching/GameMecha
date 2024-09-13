updating
rescaleMatrixStacks
	"Rescale matrix stacks to apply new dimensions"

	self tileMatrixStack ifNotNil: [
		self tileMatrixStack rescaleToWidth: self mapTileWidth height: self mapTileHeight].
		self tileMatrixStack doTiles: [:tile |
			self addMorph: tile].
	self tileMatrixStackHighlighting ifNotNil: [
		self tileMatrixStackHighlighting 
			rescaleToWidth: self mapTileWidth height: self mapTileHeight;
			reset.
		self generateHighlightingTiles]
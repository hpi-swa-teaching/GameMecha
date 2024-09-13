initialization
generateMatrixStacks
	"Generate the 3 matrix stacks (editable, highlighting, background)"
	
	"Ensures that the background layer is always behind every other layer"
	self tileMatrixStackBackground: (GMTETileMatrixStack 
		fromWidth: self tileWidth 
		height: self tileHeight 
		morphicLayerOffset: (GMTETileMatrixStack morphicLayerOffsetDefault + 1)).
	self tileMatrixStack: (GMTETileMatrixStack 
		fromWidth: self mapTileWidth 
		height: self mapTileHeight 
		morphicLayerOffset: GMTETileMatrixStack morphicLayerOffsetDefault).
	"Ensures that the visual layer is always is front of every other layer"
	self tileMatrixStackHighlighting: (GMTETileMatrixStack 
		fromWidth: self mapTileWidth 
		height: self mapTileHeight 
		morphicLayerOffset: (GMTETileMatrixStack morphicLayerOffsetDefault - GMTETileMap maxLayers - GMTETileMatrixStack morphicLayerDistance)). 
	self generateHighlightingTiles.
	self toggleBackgroundLayer
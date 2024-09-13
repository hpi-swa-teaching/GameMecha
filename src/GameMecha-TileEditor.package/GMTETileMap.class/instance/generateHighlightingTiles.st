initialization
generateHighlightingTiles
	"Fill the highlighting matrix stack with tiles automatically"
	
	self tileMatrixStackHighlighting doTilesXYLindex: [:x :y :l | 
		"It is assumed that the visual stack consists of only one layer"
		self generateTileAtlayer: l x: x y: y stack: self tileMatrixStackHighlighting tileType: GMTETileHighlighting]
	

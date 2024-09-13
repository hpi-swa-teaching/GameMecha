initialization
generateBackgroundTiles
	"Fill the background matrix stack with tiles automatically"
	
	self backgroundTiles ifNil: [^ nil].
	
	self tileMatrixStackBackground doTilesXYLindex: [:x :y :l | 
		"It is assumed that the background stack consists of only one layer"
		self generateTileAtlayer: l x: x y: y stack: self tileMatrixStackBackground tileType: GMTETile posCorrectionBlock: [:aPoint |
			self correctedTilePositionBackground: aPoint]].
	
	self tileMatrixStackBackground doTiles: [:tile |
		tile copySpriteFromTile: self backgroundTiles]
	
	
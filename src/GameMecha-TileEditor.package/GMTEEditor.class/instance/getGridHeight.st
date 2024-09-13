accessing
getGridHeight
	"Returns the height (in tiles) of the tileMap"
	
	self tileMap 
		ifNotNil: [^ self tileMap mapTileHeight]
		ifNil: [^ nil]
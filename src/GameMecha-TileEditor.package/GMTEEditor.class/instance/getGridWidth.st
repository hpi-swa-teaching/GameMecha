accessing
getGridWidth
	"Returns the width (in tiles) of the tileMap"
	
	self tileMap 
		ifNotNil: [^ self tileMap mapTileWidth]
		ifNil: [^ nil]
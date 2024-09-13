menu buttons
openTileMapInWorld
	"Open the current tileMap into world"
	
	(GMTETileMap newFromEditableTileMap: self tileMap)
		position: 0@0;
		openInWorld
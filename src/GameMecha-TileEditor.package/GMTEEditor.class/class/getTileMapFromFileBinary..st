fileHandling
getTileMapFromFileBinary: aFileBinary
	"Creates a tileMap from a file binary"
	
    ^ GMTETileMap newFrom: (GMTEEditor privateGetEditorTileMapFromFileBinary: aFileBinary)
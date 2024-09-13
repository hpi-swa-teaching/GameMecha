fileHandling
getTileMapFromFilePath: aFilePath
	"Loads a tileMap from a local file path"
	
    ^ GMTETileMap newFrom: (GMTEEditor privateGetEditorTileMapFromFilePath: aFilePath)
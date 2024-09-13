fileHandling
privateGetEditorTileMapFromFilePath: aFilePath
	"Loads a EditorTileMap from a local file path"
	 
    ^ GMTEEditor privateGetEditorTileMapFromFileBinary: (FileStream readOnlyFileNamed: aFilePath) binary contentsOfEntireFile
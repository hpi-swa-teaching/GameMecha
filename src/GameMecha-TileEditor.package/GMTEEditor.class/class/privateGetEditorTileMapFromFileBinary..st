fileHandling
privateGetEditorTileMapFromFileBinary: aFileBinary
	"Loads a EditorTileMap from a file binary"
	
    |aFileStream tileMap|
    aFileStream := (MultiByteBinaryOrTextStream with: aFileBinary) binary reset.
    tileMap := aFileStream fileInObjectAndCode.
    (tileMap isKindOf: GMTEEditorTileMap) ifFalse: [^ nil].
    ^ tileMap
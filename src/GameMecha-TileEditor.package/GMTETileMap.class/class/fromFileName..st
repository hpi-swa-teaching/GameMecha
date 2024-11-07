constants
fromFileName: fullName
	"Imports a TileMap from a .morph file and optionally converts from EditorTileMap to a TileMap"

 	| aFileStream tileMap |
	aFileStream := (MultiByteBinaryOrTextStream with: ((FileStream readOnlyFileNamed: fullName) binary contentsOfEntireFile)) binary reset.
	tileMap := aFileStream fileInObjectAndCode.
	(tileMap class = GMTEEditorTileMap)
		ifTrue: [tileMap := GMTETileMap newFromEditableTileMap: tileMap].
	^ tileMap
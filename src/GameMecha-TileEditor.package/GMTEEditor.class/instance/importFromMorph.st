menu buttons
importFromMorph
	"Import tilemap into editor from a .morph file"

	|stream tileMap|
	stream := self getFileWithFileChooser.

    	stream ifNil: [^ self].
    	tileMap := GMTEEditor privateGetEditorTileMapFromFilePath: stream.
    	self openTileMapInEditor: tileMap.
	self
		changed: #getPaddingAsString;
		changed: #getGridWidthAsString;
		changed: #getGridHeightAsString;
		changed: #getLayerList
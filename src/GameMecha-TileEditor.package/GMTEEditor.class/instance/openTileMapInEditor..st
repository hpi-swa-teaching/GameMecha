helper
openTileMapInEditor: aTileMap
	"Loads a tileMap into the editor"
	
	aTileMap tileSelectionSet highlightImage: nil.
	self tileMap: aTileMap.
	aTileMap model: self.
	self mapViewer
		removeAllMorphs;
		addMorph: aTileMap.
	self resetCommands.

	self changed: #getLayerList
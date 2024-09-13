painting
deselectTile
	"Deselect the currently selected tile"
	
	self selectedTile: nil.
	self tileMap tileSelectionSet highlightImage: nil.
	self tileTray morph submorphs first visible: false
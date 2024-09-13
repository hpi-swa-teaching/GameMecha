painting
rotateSelectedTile
	"Rotates the selected tile clockwise"
	
	self selectedTile: (self selectedTile rotateBy: #right centerAt: (self selectedTile extent / 2)).
	self tileMap tileSelectionSet 
		removeAllHighlightings;
		highlightImage: self selectedTile;
		applyAllHighlightings
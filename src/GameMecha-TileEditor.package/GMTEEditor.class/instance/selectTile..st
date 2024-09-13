painting
selectTile: anObject
	"Selects a tile from the tile store"
	
	(anObject fullResolutionSprite  = self selectedTile)
	ifTrue: [self deselectTile]
	ifFalse: [
		self selectedTile: anObject fullResolutionSprite.
		self tileMap tileSelectionSet highlightImage: anObject fullResolutionSprite.
		(self tileTray morph submorphNamed: 'selectedTile')
			visible: true;
			updateSprite: anObject fullResolutionSprite;
			extent: GMTEEditor previewTileSize]
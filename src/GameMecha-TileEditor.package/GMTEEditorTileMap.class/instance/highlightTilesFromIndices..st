updating
highlightTilesFromIndices: anIndexSet
	
	| hoveredHighlightingTile |
	self tileSelectionSet clearAllHighlightings.
	anIndexSet ifNil: [^ nil].
	
	(anIndexSet select: [:index | 
		(self tileMatrixStack layer: self model selectedLayers anyOne) inBounds: index]) do: [:tile |
			hoveredHighlightingTile := self highlightingTileFromIndex: tile.
			hoveredHighlightingTile ifNotNil: [self tileSelectionSet highlightTile: hoveredHighlightingTile]]
copying
tileLossAfterRescaleToWidth: aWidth height: aHeight layerId: aLayerId

	| removedTiles tile layer |
	removedTiles := Dictionary new.
	layer := aLayerId.
			
	(aWidth + 1) to: self columnCount do: [:col |
			1 to: self rowCount do: [:row |
				tile := self at: row at: col.
				tile ifNotNil: [removedTiles at: {col. row. layer} put: tile fullResolutionSprite]]].
	
	(aHeight + 1) to: self rowCount do: [:row |
			1 to: self columnCount do: [:col |
				tile := self at: row at: col.
				tile ifNotNil: [removedTiles at: {col. row. layer} put: tile fullResolutionSprite]]].
	
	^ removedTiles
copying
tileLossAfterRescaleToWidth: aWidth height: aHeight

	| removedTiles tile |
	removedTiles := Set new.
	
	(aWidth + 1) to: self columnCount do: [:col |
			1 to: self rowCount do: [:row |
				tile := self at: row at: col.
				tile ifNotNil: [removedTiles add: tile]]].
	
	(aHeight + 1) to: self rowCount do: [:row |
			1 to: self columnCount do: [:col |
				tile := self at: row at: col.
				tile ifNotNil: [removedTiles add: tile]]].
	
	^ removedTiles
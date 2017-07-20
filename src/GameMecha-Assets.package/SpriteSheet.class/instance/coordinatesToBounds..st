subImages
coordinatesToBounds: coordinates
	|spriteSize|
	spriteSize := self spriteForm extent / self columnsAndRows.
	^ ((coordinates - 1 asPoint) * spriteSize) extent: spriteSize.
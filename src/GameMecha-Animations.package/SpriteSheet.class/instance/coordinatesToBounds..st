accessing
coordinatesToBounds: coordinates
	|spriteSize|
	spriteSize := (self imports get: (self fileName)) extent / self columnsAndRows.
	^ ((coordinates - 1 asPoint) * spriteSize) extent: spriteSize.
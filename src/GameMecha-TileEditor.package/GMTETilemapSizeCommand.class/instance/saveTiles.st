restoring
saveTiles

	self
		tileMap: self editor tileMap;
		savedTiles: (self tileMap tileMatrixStack tileLossAfterRescaleToWidth: self newSize x height: self newSize y)
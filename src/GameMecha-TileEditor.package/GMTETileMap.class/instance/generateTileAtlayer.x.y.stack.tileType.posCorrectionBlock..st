initialization
generateTileAtlayer: aLayer x: x y: y stack: aStack tileType: aTileClass posCorrectionBlock: aBlock
	"Add a tile of type aTileClass to aLayer at position (x, y) in aStack and calculate the correct position using aBlock"

	| tilePos correctedTilePos tileExtent newTile |
	tilePos := self tilePosFromVirtual: x @ y.
	correctedTilePos := self viewCorrectedTilePosition: (aBlock value: tilePos).
	tileExtent := self viewCorrectedTileExtent: self tileSizeWidth @ self tileSizeHeight.
						
	newTile := self generateTileAtPos: correctedTilePos withExtent: tileExtent withType: aTileClass.
	
	self addMorph: newTile.
	aStack layer: aLayer at: y at: x put: newTile.

	^ newTile

	
		
	
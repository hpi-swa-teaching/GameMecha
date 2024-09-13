updating
updateTileMatrixStack: aStack posCorrectionBlock: aBlock
	"Update matrix stacks by applying new dimensions & positions"

	| tilePos correctedTilePos tileExtent tile |
	aStack doTilesXYLindex: [:x :y :l | 
		tile := aStack layer: l at: y at: x.
		
		tile ifNotNil: [
			tilePos := self tilePosFromVirtual: x @ y.
			correctedTilePos := self viewCorrectedTilePosition: (aBlock value: tilePos).
			tileExtent := self viewCorrectedTileExtent: self tileSizeWidth @ self tileSizeHeight.
			tile 
				position: correctedTilePos;
				extent: tileExtent]]
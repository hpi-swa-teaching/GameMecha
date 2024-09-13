updating
resetLayers: aSet
	
	| layer |
	aSet do: [:layerIndex |
		layer := self tileMatrixStack layer: layerIndex.
		layer withIndicesDo: [:tile :y :x |
			tile ifNotNil: [self previousTileStates at: {x. y. layerIndex} ifAbsentPut: tile fullResolutionSprite.
				self currentTileChanges at: {x. y. layerIndex} put: nil]].
		self tileMatrixStack resetLayer: layerIndex].
	
	self saveTileEditChanges
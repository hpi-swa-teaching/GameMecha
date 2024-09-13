updating
placeTiles: anIndexSet inLayer: aLayer
	"add currently selected tile (model) to editable matrix stack at given indices"

	| tile |
	anIndexSet do: [:index |
		self savePreviousImageFromIndex: index inLayer: aLayer.
		((self tileMatrixStack layer: aLayer) inBounds: index) ifTrue: [
				tile := self tileMatrixStack layer: aLayer at: index y at: index x.
				tile ifNil: [tile := self generateTileAtlayer: aLayer x: index x y: index y stack: tileMatrixStack tileType: GMTETile].
				self model selectedTile ifNotNil: [tile updateSprite: self model selectedTile].
				self saveNewImageFromIndex: index inLayer: aLayer.
				self model savedSinceModified: false]]
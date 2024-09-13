updating
placeTiles: anIndexSet inLayer: aLayer ofClass: aTileClass withImage: anImage

	| tile |
	self assert: (aTileClass inheritsFrom: GMTETile) description: 'Expected GMTETile or subclass'.

	anIndexSet do: [:c |
		((self tileMatrixStack layer: aLayer) inBounds: c) ifTrue: [
				tile := self tileMatrixStack layer: aLayer at: c y at: c x.
				tile ifNil: [tile := self generateTileAtlayer: aLayer x: c x y: c y stack: tileMatrixStack tileType: aTileClass].
				tile updateSprite: anImage]]
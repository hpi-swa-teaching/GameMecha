updating
deleteTiles: anIndexSet inLayer: aLayer
	"delete tiles from editable matrix stack at given indices"
	
	| tile |
	anIndexSet do: [:index |
		((self tileMatrixStack layer: aLayer) inBounds: index) ifTrue: [
			tile := self tileMatrixStack layer: aLayer at: index y at: index x.
			tile	ifNotNil: [ 
				self savePreviousImageFromIndex: index inLayer: aLayer.
				tile abandon.
				self tileMatrixStack layer: aLayer at: index y at: index x put: nil.
				self saveNewImageFromIndex: index inLayer: aLayer.
				self model savedSinceModified: false]]]
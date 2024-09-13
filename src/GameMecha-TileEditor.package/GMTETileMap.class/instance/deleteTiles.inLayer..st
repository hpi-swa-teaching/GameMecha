updating
deleteTiles: anIndexSet inLayer: aLayer
	"delete tiles from editable matrix stack at given indices"
	
	| tile |
	anIndexSet do: [:c |
		((self tileMatrixStack layer: aLayer) inBounds: c) ifTrue: [
			tile := self tileMatrixStack layer: aLayer at: c y at: c x.
			tile	ifNotNil: [ 
				tile abandon.
				self tileMatrixStack layer: aLayer at: c y at: c x put: nil]]]
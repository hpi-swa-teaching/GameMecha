accessing
getLayerList
	"Returns the list of all layers"
	
	self tileMap ifNil: [^ OrderedCollection new].
	
	^ self tileMap tileMatrixStack collectLayers: [:aLayer | aLayer displayName, (GMTEEditor getVisibilityIndicator: aLayer visible)]
multiselect-helpers
mapLayers: anOrderedCollection withUnaryBlock: aBlock
	"Run an unary aBlock for every member of anOrderedCollection and return the result"
	
	^ anOrderedCollection collect: [ :layerIndex | (aBlock value: layerIndex)]
	
	
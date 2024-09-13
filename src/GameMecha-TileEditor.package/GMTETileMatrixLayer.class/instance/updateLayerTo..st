updating
updateLayerTo: anIndex
	"Set a new layerIndex & update morphicLayerNumber accordingly"

	self layerIndex: anIndex.
	self doTiles: [:tile | tile morphicLayerNumber: self layerIndex]
layer manipulation
selectLayer: anIndex
	"Select the layer with anIndex"
	
	self selectedLayers add: anIndex.
	self updateButtonEnabled.
	self
		changed: #selectedLayers;
		changed: #layerAt:
	
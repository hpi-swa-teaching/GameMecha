layer manipulation
deselectLayer: anIndex
	"Deselects the layer with the provided index"
	
	(self selectedLayers size <= 1) ifTrue: [^ nil].
	
	(self selectedLayers includes: anIndex)
		ifTrue: [
			self selectedLayers remove: anIndex.
			self updateButtonEnabled.
			self
				changed: #selectedLayers;
				changed: #layerAt:]
	
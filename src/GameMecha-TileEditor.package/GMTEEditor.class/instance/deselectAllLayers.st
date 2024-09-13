layer manipulation
deselectAllLayers
	"Empties the selected layers set"
	
	self
		selectedLayers: Set new;
		changed: #selectedLayers
	
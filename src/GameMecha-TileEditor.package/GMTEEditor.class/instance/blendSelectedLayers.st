layer manipulation
blendSelectedLayers
	"Fuses the selected layers into one layer"
	
	self
		addCommand: (GMTEBlendLayersCommand fromLayers: self selectedLayers editor: self);
		blendLayers: self selectedLayers
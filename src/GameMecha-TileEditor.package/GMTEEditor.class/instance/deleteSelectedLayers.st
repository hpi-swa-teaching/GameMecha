layer manipulation
deleteSelectedLayers
	"Deletes all selected layers unless this would delete all layers"
	
	(self anyLayerSelected not or: (self selectedLayers size >= self getLayerList size)) ifTrue: [^ nil].
	
	self
		addCommand: (GMTEDeleteLayersCommand fromLayers: self selectedLayers editor: self);
		deleteTilemapLayers: self selectedLayers
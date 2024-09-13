layer manipulation
selectOnlyLayer: anIndex
	"Select only the layer with anIndex"
	
	self 
		deselectAllLayers;
		selectLayer: anIndex
	
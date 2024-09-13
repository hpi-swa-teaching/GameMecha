layer manipulation
selectAllLayers
	"Selects all layers"
	
	1 to: self layerCount do: [:i | self selectLayer: i]
	
updating
silentlyResetLayers: aSet
	"Resets a without recording changes for the Command processor"
	
	aSet do: [:layerIndex | self tileMatrixStack resetLayer: layerIndex].

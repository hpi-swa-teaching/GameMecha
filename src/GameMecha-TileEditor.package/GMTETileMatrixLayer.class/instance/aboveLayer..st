comparing
aboveLayer: aLayer
	
	"As a layerIndex corresponds to the morphicLayerNumber smaller is 'better'"
	^ (self layerIndex < aLayer layerIndex)
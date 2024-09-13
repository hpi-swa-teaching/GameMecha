layer manipulation
blendLayers: aLayerList
	"Fuses the layers into one layer"
	
	| bakedLayer |
	(aLayerList size > 1)
		ifTrue: [
			bakedLayer := aLayerList min.
			self tileMap tileMatrixStack blendLayers: aLayerList.
			self
				deselectAllLayers;
				selectLayer: bakedLayer].
	self changed: #getLayerList
removing
reset
	"Remove all layers (except base layer) and free all tiles"

	self layerCount to: 2 by: -1 do: [:layer | self removeLayerAt: layer].
	self resetLayer: 1
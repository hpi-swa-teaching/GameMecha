eumerating
doTilesXYLindex: aBlock
	"For every tile in every layer run a aBlock with arguments [:x :y :layerIndex | ...]"

	1 to: self width do: [:x | 
		1 to: self height do: [:y |
			1 to: self layerCount do: [:layerIndex | 
				aBlock value: x value: y value: layerIndex]]]
eumerating
doLayers: aBlock

	self matrixLayers do: [:layer | aBlock value: layer]
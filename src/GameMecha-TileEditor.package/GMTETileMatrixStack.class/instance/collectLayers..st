eumerating
collectLayers: aBlock

	^ self matrixLayers collect: [:layer | aBlock value: layer]
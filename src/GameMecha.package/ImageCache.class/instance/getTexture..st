as yet unclassified
getTexture: path
	^ self images
		at: path
		ifAbsentPut: [self actuallyLoadTexture: path].
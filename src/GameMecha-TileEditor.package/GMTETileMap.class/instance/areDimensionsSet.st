checking
areDimensionsSet
	"Check if attributes regarded as 'dimensions' are properly initialized"

	^ (self mapTileWidth notNil) and: [(self mapTileWidth notNil) and: [self mapPadding notNil]]
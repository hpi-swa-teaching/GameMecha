updating
rescaleMapWidth: aWidth height: aHeigth padding: aPadding
	"Rescale map & trigger update"
	
	"Warning: If padding is to small relative to map, divisions by zero can occur"
	| sizeChanged |
	sizeChanged := (aWidth ~= self mapTileWidth) or: [aHeigth ~= self mapTileHeight].

	self setDimensionsWidth: aWidth height: aHeigth padding: aPadding.
	sizeChanged ifTrue: [self rescaleMatrixStacks].
	self updateMap
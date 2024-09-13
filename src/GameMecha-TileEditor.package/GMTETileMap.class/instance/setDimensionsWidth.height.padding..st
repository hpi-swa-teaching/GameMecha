accessing
setDimensionsWidth: aWidth height: aHeigth padding: aPadding
	"Set dimensions (defines what is considered as part of 'dimensions')"

	self
		mapTileWidth: aWidth;
		mapTileHeight: aHeigth;
		mapPadding: aPadding
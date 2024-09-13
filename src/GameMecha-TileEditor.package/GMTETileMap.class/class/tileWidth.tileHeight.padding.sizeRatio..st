instance creation
tileWidth: aWidth tileHeight: aHeight padding: aPadding sizeRatio: aRatio
	
	^ (self new)
		setDimensionsWidth: aWidth height: aHeight padding: aPadding;
		tileSizeRatio: aRatio
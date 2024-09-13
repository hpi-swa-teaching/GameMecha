instance creation
tileWidth: aWidth tileHeight: aHeight padding: aPadding sizeRatio: aRatio model: aModel
	
	^ (self new)
		setDimensionsWidth: aWidth height: aHeight padding: aPadding;
		tileSizeRatio: aRatio;
		model: aModel
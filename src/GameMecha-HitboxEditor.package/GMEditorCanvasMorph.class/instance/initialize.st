initialization
initialize

	super initialize.
	self
		tileSize: self defaultTileSize;
		backgroundColor: self defaultBackgroundColor;
		gridColor: self defaultGridColor;
		borderWidth: 0;
		hResizing: #spaceFill;
		vResizing: #spaceFill
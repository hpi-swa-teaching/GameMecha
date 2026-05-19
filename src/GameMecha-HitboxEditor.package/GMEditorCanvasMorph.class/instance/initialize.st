initialization
initialize

	super initialize.
	self tileSize: self defaultTileSize.
	self backgroundColor: self defaultBackgroundColor.
	self gridColor: self defaultGridColor.
	self borderWidth: 0.
	self hResizing: #spaceFill.
	self vResizing: #spaceFill
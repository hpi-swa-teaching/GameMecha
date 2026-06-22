initialization
initialize

	super initialize.
	self
		scaleFactor: self defaultScaleFactor;
		tileSize: self defaultTileSize;
		backgroundColor: self defaultBackgroundColor;
		gridColor: self defaultGridColor;
		borderWidth: 0;
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	
	self viewport: TransformMorph new.
	self viewport
		color: Color transparent;
		bounds: self bounds;
		scale: self scaleFactor.
	
	self addMorph: self viewport
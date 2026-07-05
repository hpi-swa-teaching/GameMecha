initialize-release
initialize

	super initialize.
	
	self
		scaleFactor: self defaultScaleFactor;
		tileSize: self defaultTileSize;
		backgroundColor: self defaultBackgroundColor;
		gridColor: self defaultGridColor;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		borderWidth: 2 px;
		borderColor: Color transparent;
		viewport: TransformMorph new.
	
	self viewport
		color: Color transparent;
		bounds: self bounds;
		scale: self scaleFactor.
	self addMorph: self viewport
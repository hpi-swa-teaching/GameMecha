initialization
setContent: aMorph

	content := aMorph.
	self
		position: aMorph position;
		extent: aMorph extent;
		addMorph: aMorph;
		addMouseCaptureFilter: self;
		addResizeHandles.
	aMorph lock: true
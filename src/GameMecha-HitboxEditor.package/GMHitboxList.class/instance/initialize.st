initialization
initialize

	super initialize.
	self
		listDirection: #topToBottom;
		listCentering: #topLeft;
		cellPositioning: #topLeft;
		layoutPolicy: TableLayout new;
		listSpacing: #none;
		cellInset: 5;
		hResizing: #spaceFill;
		vResizing: #rigid;
		height: 400 px;
		wrapCentering: #center;
		cellPositioning: #center;
		color: Color transparent;
		borderWidth: 0.
	self entries: Bag new.
	self symbols: Bag new
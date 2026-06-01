initialization
initialize

	super initialize.
	
	self
		hResizing: #rigid;
		width: 200 px;
		vResizing: #rigid;
		height: 300 px;
		listDirection: #topToBottom;
		listCentering: #topLeft;
		cellPositioning: #topLeft;
		layoutPolicy: TableLayout new;
		color:  Color transparent.
		
	self initializePanel
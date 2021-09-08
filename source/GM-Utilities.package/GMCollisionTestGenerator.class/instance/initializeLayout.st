initialization
initializeLayout
	self
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		color: self initialColor;
		extent: self initialExtent.
	self 
		initializeButtons;
		initializeLabels.
		
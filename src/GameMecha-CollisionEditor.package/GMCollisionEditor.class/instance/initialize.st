initialize
initialize

	super initialize.
	self
		extent: 1200 px @ 900 px;
		color: self browserColor;
		initializeUI;
		colliderTree: (GMCompositeEditorNode new symbol: #'0');
		sidebarColliderDictionary: Dictionary new;
		symbolCounter: 0;
		openInWindow
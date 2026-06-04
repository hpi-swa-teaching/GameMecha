initialize
initialize

	super initialize.
	self
		extent: 1200 px @ 900 px;
		color: Color gray;
		initializeUI;
		colliderTree: GMEditorNode new;
		sidebarColliderDictionary: Dictionary new;
		symbolCounter: 0
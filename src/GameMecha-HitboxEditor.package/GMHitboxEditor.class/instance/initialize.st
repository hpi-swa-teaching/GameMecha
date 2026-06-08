initialize
initialize

	super initialize.
	self
		extent: 1200 px @ 900 px;
		color: Color gray;
		initializeUI;
		colliderTree: (GMEditorNode new colliderType: GMCompositeCollider; symbol: #'0');
		sidebarColliderDictionary: Dictionary new;
		symbolCounter: 0;
		selectedMorph: CircleMorph new.
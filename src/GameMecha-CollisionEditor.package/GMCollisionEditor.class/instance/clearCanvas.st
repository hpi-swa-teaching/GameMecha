canvas
clearCanvas

	self canvasMorph removeAllMorphsFromCanvas.
	self
		selectedMorph: nil;
		updateSidebarColliderList;
		initializeColliderTree.
	
	self classNameLabel contents: ''
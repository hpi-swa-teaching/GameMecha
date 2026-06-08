initialize
initializeWorkspace

	self initializeCanvas.
	self initializeSidebar.
	self workspace: (
		AlignmentMorph newRow
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			color: Color transparent;
			borderWidth: 0;
			addMorphBack: self canvasMorph;
			addMorphBack: self sidebar
			)
initialize
initializeWorkspace

	^ AlignmentMorph newRow
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color transparent;
		borderWidth: 0;
		addMorphBack: self initializeCanvas;
		addMorphBack: self initializeSidePanel
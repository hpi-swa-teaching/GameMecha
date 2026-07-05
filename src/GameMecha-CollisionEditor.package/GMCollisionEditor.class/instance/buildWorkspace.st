creation
buildWorkspace

	^ AlignmentMorph newRow
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color transparent;
		borderWidth: 0;
		addMorphBack: self buildCanvas;
		addMorphBack: self buildSidebar
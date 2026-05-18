as yet unclassified
initializeWorkspace

	| row |
	row := AlignmentMorph newRow.
	row
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color transparent;
		borderWidth: 0;
		addMorphBack: self initializeCanvas;
		addMorphBack: self initializeSidePanel.
	"row separation: 0."
	^ row
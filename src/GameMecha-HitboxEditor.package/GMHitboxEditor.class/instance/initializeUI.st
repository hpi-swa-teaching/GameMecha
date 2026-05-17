as yet unclassified
initializeUI

	| outer |
	outer := AlignmentMorph newColumn.
	outer
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color transparent;
		borderWidth: 0;
		addMorphBack: self initializeToolbar;
		addMorphBack: self initializeWorkspace.
	self addMorph: outer
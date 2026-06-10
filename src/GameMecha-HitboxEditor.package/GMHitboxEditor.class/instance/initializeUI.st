initialize
initializeUI

	| outer |
	outer := AlignmentMorph newColumn.
	self initializeToolbar.
	self initializeWorkspace.
	outer
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color transparent;
		borderWidth: 0;
		addMorphBack: self toolbar;
		addMorphBack: self workspace.
	self addMorph: outer
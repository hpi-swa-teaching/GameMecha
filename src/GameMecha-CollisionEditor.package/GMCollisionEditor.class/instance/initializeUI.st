initialize
initializeUI

	self addMorph: (AlignmentMorph newColumn
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color transparent;
		borderWidth: 2;
		addMorphBack: self initializeToolbar;
		addMorphBack: self initializeWorkspace)
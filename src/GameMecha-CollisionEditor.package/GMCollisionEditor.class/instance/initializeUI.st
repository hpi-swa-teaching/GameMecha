initialize-release
initializeUI

	self
		changeTableLayout;
		clipSubmorphs: true.
	
	self addMorph: (AlignmentMorph newColumn
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color transparent;
		borderWidth: 2;
		addMorphBack: self buildToolbar;
		addMorphBack: self buildWorkspace)
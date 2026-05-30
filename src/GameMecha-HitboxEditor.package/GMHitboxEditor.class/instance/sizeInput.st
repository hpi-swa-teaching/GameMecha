initialize
sizeInput

	^ AlignmentMorph newRow
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		addMorphBack: (self labelMorph: 'x: ');
		addMorphBack: self textfieldFixedSize;
		addMorphBack: (self labelMorph: '     y: ');
		addMorphBack: self textfieldFixedSize;
		color: self sidebarBackgroundColor
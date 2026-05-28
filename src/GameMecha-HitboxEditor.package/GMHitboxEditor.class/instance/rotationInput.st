initialize
rotationInput

	^ AlignmentMorph newRow
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		addMorphBack: (self labelMorph: '             rotation: ');
		addMorphBack: self textfieldFixedSize;
		color: self sidebarBackgroundColor
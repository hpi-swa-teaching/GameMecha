ui-elements
sizeInput

	^ AlignmentMorph newRow
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		addMorphBack: (self labelMorph: 'x: ');
		addMorphBack: self xSizeInputField;
		addMorphBack: (self labelMorph: '     y: ');
		addMorphBack: self ySizeInputField;
		color: self sidebarBackgroundColor;
		yourself
ui-elements
sizeInput

	^ AlignmentMorph newRow
		addMorphBack: (self initializeLabelMorph: 'x: ');
		addMorphBack: self xSizeInputField;
		addMorphBack: (self initializeLabelMorph: '     y: ');
		addMorphBack: self ySizeInputField;
		color: self backgroundColor;
		yourself
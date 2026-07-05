ui-elements
sizeInput

	^ AlignmentMorph newRow
		addMorphBack: (self buildLabelMorph: 'x: ');
		addMorphBack: self xSizeInputField;
		addMorphBack: (self buildLabelMorph: '     y: ');
		addMorphBack: self ySizeInputField;
		color: self backgroundColor;
		yourself
ui-elements
rotationInput

	^ AlignmentMorph newRow
		addMorphBack: (self initializeLabelMorph: 'deg: ');
		addMorphBack: self rotationInputField;
		color: self backgroundColor;
		yourself
ui-elements
rotationInput

	^ AlignmentMorph newRow
		addMorphBack: (self buildLabelMorph: 'deg: ');
		addMorphBack: self rotationInputField;
		color: self backgroundColor;
		yourself
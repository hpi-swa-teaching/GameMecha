ui-elements
posInput

	^ AlignmentMorph newRow
		addMorphBack: (self initializeLabelMorph: 'x: ');
		addMorphBack: self xPosInputField;
		addMorphBack: (self initializeLabelMorph: '     y: ');
		addMorphBack: self yPosInputField;
		color: self backgroundColor;
		yourself
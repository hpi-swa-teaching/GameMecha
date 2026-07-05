ui-elements
posInput

	^ AlignmentMorph newRow
		addMorphBack: (self buildLabelMorph: 'x: ');
		addMorphBack: self xPosInputField;
		addMorphBack: (self buildLabelMorph: '     y: ');
		addMorphBack: self yPosInputField;
		color: self backgroundColor;
		yourself
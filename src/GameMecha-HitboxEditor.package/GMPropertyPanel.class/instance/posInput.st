ui-elements
posInput

	^ AlignmentMorph newRow
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		addMorphBack: (self labelMorph: 'x: ');
		addMorphBack: self xPosInputField;
		addMorphBack: (self labelMorph: '     y: ');
		addMorphBack: self yPosInputField;
		color: self sidebarBackgroundColor;
		yourself
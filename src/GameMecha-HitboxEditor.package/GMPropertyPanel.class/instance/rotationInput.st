ui-elements
rotationInput

	^ AlignmentMorph newRow
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		addMorphBack: (self labelMorph: '             rotation: ');
		addMorphBack: self rotationInputField;
		color: self sidebarBackgroundColor;
		yourself
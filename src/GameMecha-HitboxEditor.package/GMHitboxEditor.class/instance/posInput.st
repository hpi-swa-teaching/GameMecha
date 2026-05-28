initialize
posInput

	^ AlignmentMorph newRow
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		addMorphBack: (self labelMorph: 'x: ');
		addMorphBack: self textfieldFixedSize;
		addMorphBack: (self labelMorph: '     y: ');
		addMorphBack: self textfieldFixedSize;
		color: self sidebarBackgroundColor
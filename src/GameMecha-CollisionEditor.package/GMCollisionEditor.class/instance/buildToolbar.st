creation
buildToolbar

	| bar |
	bar := AlignmentMorph newRow.
	bar
		hResizing: #rigid;
		width: 1200 px;
		vResizing: #rigid;
		height: 75 px;
		cellPositioning: #center;
		wrapCentering: #center;
		color: self backgroundColor;
		borderColor: Color transparent;
		borderWidth: 2px;
		layoutInset: 5;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: (self buildLabelMorph: 'Class: ');
		addMorphBack: self classNameLabel;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self buildSelectButton;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: self buildSeparatorMorph;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: self buildImportButton;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self buildExportButton;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: self buildSeparatorMorph;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: (self buildLabelMorph: 'Scale: ');
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self buildScaleInputField;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self buildScaleButton;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: self buildSeparatorMorph;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: self buildRectButton;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self buildCircleButton.
	^ bar
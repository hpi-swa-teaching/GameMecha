initialize-release
initializeToolbar

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
		addMorphBack: (self initializeLabelMorph: 'Class: ');
		addMorphBack: self classNameLabel;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self initializeSelectButton;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: self InitializeSeparatorMorph;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: self initializeImportButton;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self initializeExportButton;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: self InitializeSeparatorMorph;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: (self initializeLabelMorph: 'Scale: ');
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self initializeScaleInput;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self initializeScaleButton;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: self InitializeSeparatorMorph;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: self initializeRectButton;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self initializeCircleButton.
	^ bar
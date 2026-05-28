initialize
initializeToolbar
	"Single horizontal row — sprite picker, frame picker, tool buttons."

	| bar rectBtn circleBtn |
	rectBtn := GMRectangleButtonMorph new
		action: #D;
		yourself.
	
	circleBtn := GMCircleButtonMorph new
		action: #D;
		yourself.
	
	bar := AlignmentMorph newRow.
	bar
		hResizing: #rigid;
		width: 1200 px;
		vResizing: #rigid;
		height: 75 px;
		cellPositioning: #center;
		wrapCentering: #center;
		color: self toolbarBackgroundColor;
		borderColor: Color darkGray;
		borderWidth: 1;
		layoutInset: 5;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: (self labelMorph: 'class:      "player_idle.png"     ');
		addMorphBack: self selectButton;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self separatorMorph;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: (self labelMorph: 'frame:     ');
		addMorphBack: (self toolButtonLabeled: 'frame_00');
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: rectBtn;
		addMorphBack: circleBtn.
	
	^ bar
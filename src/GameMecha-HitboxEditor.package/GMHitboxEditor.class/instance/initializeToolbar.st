initialize
initializeToolbar
	"Single horizontal row — sprite picker, frame picker, tool buttons."

	| bar rectBtn circleBtn |
	rectBtn := GMRectangleButtonMorph new
		action: [
			|rectangle|
			rectangle := Morph new. 
			rectangle 
				extent: (250px @ 150px);
				color: (Color red alpha: 0.5).
				
				self canvasMorph drawMorphOnCanvas: rectangle.
				self updateSidebarColliderList
			];
		yourself.
	
	circleBtn := GMCircleButtonMorph new
		action: [
			|circle|
			circle := EllipseMorph new. 
			circle 
				extent: (200px @ 200px);
				color: (Color yellow alpha: 0.5).
				
				self canvasMorph drawMorphOnCanvas: circle.
				self updateSidebarColliderList
			];
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
		addMorphBack: (self labelMorph: 'Class: ');
		addMorphBack: self classTextInputField ;
		addMorphBack: self selectButton;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self separatorMorph;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: (self labelMorph: 'frame:     ');
		addMorphBack: (self toolButtonLabeled: 'frame_00');
		addTransparentSpacerOfSize: 40 px.
		
	
	bar addMorphBack:  rectBtn.
	bar addMorphBack: circleBtn.
	
	^ bar
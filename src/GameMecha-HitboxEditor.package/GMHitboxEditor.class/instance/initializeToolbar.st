initialize
initializeToolbar

	| bar rectBtn circleBtn |
	rectBtn := GMRectangleButtonMorph new
		action: [ | rectangle |
			rectangle := Morph new.
			rectangle extent: 250 px @ 150 px.
			self selectedMorph ifNil:[UIManager default inform: 'You need to select a Morph first!'] ifNotNil: [
				self canvasMorph addHitboxToCanvas: rectangle.
				self addCollider: rectangle atNode: self colliderTree nodeType: GMRectangleEditorNode.
				self updateSidebarColliderList]];
		yourself.
	
	circleBtn := GMCircleButtonMorph new
		action: [ | circle |
			circle := EllipseMorph new.
			circle extent: 200 px @ 200 px.
			self selectedMorph ifNotNil: [
				self canvasMorph addHitboxToCanvas: circle.
				self addCollider: circle atNode: self colliderTree nodeType: GMCircleEditorNode.
				self updateSidebarColliderList]];
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
		addMorphBack: self classNameLabel;
		addTransparentSpacerOfSize: 10 px;
		addMorphBack: self selectButton;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self separatorMorph;
		addTransparentSpacerOfSize: 40 px;
		addMorphBack: self exportButton;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self importButton;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self setScaleButton;
		addTransparentSpacerOfSize: 20 px;
		addMorphBack: self scaleTextInputField;
		addTransparentSpacerOfSize: 20 px.
	
	bar addMorphBack: rectBtn.
	bar addMorphBack: circleBtn.
	
	self toolbar: bar
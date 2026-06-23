initialize
initializeSidebar
	"Vertical column: section header, morph-type list, divider, size controls."

	| bar |
	self initializeTreeView.
	bar := AlignmentMorph newColumn
		hResizing: #rigid;
		width: 250 px;
		vResizing: #rigid;
		height: 900 px;
		color: self sidebarBackgroundColor;
		borderColor: Color darkGray;
		borderWidth: 1;
		addMorphBack: (self labelMorph: ' HitboxList');
		addMorphBack: (Morph new
			extent: 190 px @ 1 px;
			color: Color darkGray);
		addMorphBack: self treeView;
		addMorphBack: (Morph new
			extent: 190 px @ 1 px;
			color: Color darkGray);
		addMorphBack: self propertyPanel.
	self sidebar: bar
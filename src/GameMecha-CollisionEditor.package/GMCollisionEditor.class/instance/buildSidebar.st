creation
buildSidebar

	| buttonRow |
	self propertyPanel: (GMPropertyPanel new editor: self).
	buttonRow := AlignmentMorph newRow
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		cellInset: 10;
		color: Color transparent;
		addMorphBack: self buildRemoveButton;
		addMorphBack: self buildClearButton.
	
	^ AlignmentMorph newColumn
		hResizing: #rigid;
		width: 250 px;
		vResizing: #rigid;
		height: 900 px;
		color: self backgroundColor;
		borderColor: Color transparent;
		borderWidth: 2 px;
		addMorphBack: (self buildLabelMorph: ' ColliderList ');
		addMorphBack: (Morph new
			extent: 190 px @ 1 px;
			color: self textColor);
		addMorphBack: self buildTreeView;
		addMorphBack: (Morph new
			extent: 190 px @ 1 px;
			color: self textColor);
		addMorphBack: buttonRow;
		addMorphBack: self propertyPanel
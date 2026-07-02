initialize
initializeSidebar
	"Vertical column: section header, morph-type list, divider, size controls."

	| buttonRow |
	self propertyPanel: (GMPropertyPanel new editor: self).
	buttonRow := AlignmentMorph newRow
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		cellInset: 10;
		color: Color transparent;
		addMorphBack: self initializeRemoveButton;
		addMorphBack: self initializeClearButton.
	
	^ AlignmentMorph newColumn
		hResizing: #rigid;
		width: 250 px;
		vResizing: #rigid;
		height: 900 px;
		color: self backgroundColor;
		borderColor: Color transparent;
		borderWidth: 2 px;
		addMorphBack: (self initializeLabelMorph: ' ColliderList ');
		addMorphBack: (Morph new
			extent: 190 px @ 1 px;
			color: self textColor);
		addMorphBack: self initializeTreeView;
		addMorphBack: (Morph new
			extent: 190 px @ 1 px;
			color: self textColor);
		addMorphBack: buttonRow;
		addMorphBack: self propertyPanel
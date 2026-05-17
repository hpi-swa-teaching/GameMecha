as yet unclassified
initializeSidePanel
	"Vertical column: section header, morph-type list, divider, size controls."

	| col |
	col := AlignmentMorph newColumn.
	col
		hResizing: #rigid;
		width: 250 px;
		vResizing: #rigid;
		height: 900 px;
		color: Color black;
		borderColor: Color darkGray;
		borderWidth: 1;
		addMorphBack: (self labelMorph: ' HitboxList');
		addMorphBack: (Morph new
			extent: 190 px @ 1 px;
			color: Color darkGray);
		addMorphBack: self initializeMorphHitboxList;
		addMorphBack: (Morph new
			extent: 190 px @ 1 px;
			color: Color darkGray);
		addMorphBack: (self labelMorph: ' rect1 Positioning');
		addMorphBack: self posInput;
		addMorphBack: self sizeInput.
	^ col
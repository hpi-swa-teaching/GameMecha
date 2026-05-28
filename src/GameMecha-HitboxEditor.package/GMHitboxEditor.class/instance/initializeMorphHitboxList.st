initialize
initializeMorphHitboxList
	"Vertical column of selectable morph-type rows."

	| col |
	col := AlignmentMorph newColumn.
	col
		hResizing: #spaceFill;
		vResizing: #rigid;
		height: 400 px;
		wrapCentering: #center;
		cellPositioning: #center;
		color: Color transparent;
		borderWidth: 0.
	self sampleHitboxes do: [:entry | col addMorphBack: (self toolButtonLabeled: entry)].
	^ col
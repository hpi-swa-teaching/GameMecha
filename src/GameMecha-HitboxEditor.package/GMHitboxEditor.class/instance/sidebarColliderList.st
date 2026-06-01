sidebar
sidebarColliderList
"Vertical column of selectable morph-type rows."
	
	^sidebarColliderList ifNil: [
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
		"col separation: 0."
		(self canvasMorph submorphs) do: [:entry | col addMorphBack: ((self toolButtonLabeled: entry) color: Color gray)].
		sidebarColliderList := col. 
	].
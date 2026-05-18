as yet unclassified
sizeInput

	| dings |
	dings := AlignmentMorph newRow.
	dings
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		addMorphBack: (self labelMorph: 'x:');
		addMorphBack: self xSizeInput;
		addMorphBack: (self labelMorph: 'y:');
		addMorphBack: self ySizeInput.
	" acceptSelector: #myFunction:;
	 acceptTarget: self;"
	^ dings
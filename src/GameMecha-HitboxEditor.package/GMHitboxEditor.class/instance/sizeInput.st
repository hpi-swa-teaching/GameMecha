as yet unclassified
sizeInput

	| inputText |
	inputText := AlignmentMorph newRow.
	inputText
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		addMorphBack: (self labelMorph: 'x:');
		addMorphBack: self xSizeInput;
		addMorphBack: (self labelMorph: 'y:');
		addMorphBack: self ySizeInput;
		color: self textFieldColor.
	" acceptSelector: #myFunction:;
	 acceptTarget: self;"
	^ inputText
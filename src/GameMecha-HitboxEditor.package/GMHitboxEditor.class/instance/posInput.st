as yet unclassified
posInput

	| dings |
	dings := AlignmentMorph newRow.
	dings
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		addMorphBack: (self labelMorph: 'x:');
		addMorphBack: self xPosInput;
		addMorphBack: (self labelMorph: 'y:');
		addMorphBack: self yPosInput;
		color: self textFieldColor.
	" acceptSelector: #myFunction:;
	 acceptTarget: self;"
	^ dings
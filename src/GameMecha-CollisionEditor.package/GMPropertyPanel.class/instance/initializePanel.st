initialize-release
initializePanel

	self
		addMorphBack: (self buildLabelMorph: ' Center Position');
		addMorphBack: self posInput;
		addMorphBack: (self buildLabelMorph: ' Morph Size ');
		addMorphBack: self sizeInput;
		addMorphBack: (self buildLabelMorph: ' Rotation ');
		addMorphBack: self rotationInput
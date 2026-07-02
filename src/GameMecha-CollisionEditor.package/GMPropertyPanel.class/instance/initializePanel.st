initialization
initializePanel

	self
		addMorphBack: (self initializeLabelMorph: ' Center Position');
		addMorphBack: self posInput;
		addMorphBack: (self initializeLabelMorph: ' Morph Size ');
		addMorphBack: self sizeInput;
		addMorphBack: (self initializeLabelMorph: ' Rotation ');
		addMorphBack: self rotationInput
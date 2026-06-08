initialization
initializePanel

	self
		addMorphBack: (self labelMorph: ' Center Position');
		addMorphBack: self posInput;
		addMorphBack: (self labelMorph: ' Morph Size ');
		addMorphBack: self sizeInput;
		addMorphBack: self rotationInput
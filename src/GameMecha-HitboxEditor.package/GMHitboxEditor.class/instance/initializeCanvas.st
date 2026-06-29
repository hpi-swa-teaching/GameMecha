initialize
initializeCanvas

	self canvasMorph: GMEditorCanvasMorph new.
	self canvasMorph
		gridColor: self secondaryColor;
		editor: self;
		yourself
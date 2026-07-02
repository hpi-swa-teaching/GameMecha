initialize
initializeCanvas

	self canvasMorph: (GMEditorCanvasMorph new
		gridColor: self buttonTextColor;
		editor: self).
	^ self canvasMorph
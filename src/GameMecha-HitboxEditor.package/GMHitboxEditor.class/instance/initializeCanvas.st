as yet unclassified
initializeCanvas

	self canvasMorph: GMEditorCanvasMorph new.
	(self canvasMorph) gridColor: self secondaryColor.
	
	^ self canvasMorph
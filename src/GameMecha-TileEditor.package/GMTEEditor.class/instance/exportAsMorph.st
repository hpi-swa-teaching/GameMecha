accessing
exportAsMorph
	"Saves the current tileMap as a .morph file (as EditorTileMap), which allows for reimporting"
	| currentModel |
	
	currentModel := self tileMap model.
	self tileMap
		model: nil;
		resetView;
		saveOnFile;
		model: currentModel.
	self savedSinceModified: true
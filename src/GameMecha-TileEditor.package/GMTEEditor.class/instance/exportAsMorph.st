menu buttons
exportAsMorph
	"Saves the current tileMap as a .morph file, which allows for reimporting"
	
	((self tileMap veryDeepCopy) 
		model: nil;
		resetView
	) saveOnFile. 
	self savedSinceModified: true
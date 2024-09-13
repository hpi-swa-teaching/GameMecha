initialization
initialize
	
	super initialize.
	self
		resetCommands;
		currentCommand: 1;
		selectedLayers: Set new;
		selectLayer: 1;
		brushButtons: GMTEButtonGroup new;
		open;
		savedSinceModified: true;
		updateButtonEnabled;
		changed: #getLayerList;
		initializeBrush
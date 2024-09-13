building
placeSelectedTileIntoTileTray
	
	| selectedTile |
	selectedTile := GMTETileSelector new 
		visible: false;
		name: 'selectedTile';
		model: self;
		yourself.
		
	self tileTray morph 
		color: Color transparent;
		addMorph: selectedTile
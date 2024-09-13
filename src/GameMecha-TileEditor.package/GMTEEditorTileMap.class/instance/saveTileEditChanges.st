command processing
saveTileEditChanges
	"Sends all recorded changes to the TileEditor and resets the list of changes"
	| command |
	
	command := GMTEEditTilesCommand previousTiles: self previousTileStates currentTiles: self currentTileChanges tilemap: self.
	
	self model addCommand: command.
	self resetTileEditChanges
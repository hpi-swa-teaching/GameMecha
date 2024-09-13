squeakutils
register
	"Adds the tile editor to app menu"
	
	"Maybe call this on new?"
	TheWorldMenu registerOpenCommand: {'TileMap Editor'. {self. #startup}}
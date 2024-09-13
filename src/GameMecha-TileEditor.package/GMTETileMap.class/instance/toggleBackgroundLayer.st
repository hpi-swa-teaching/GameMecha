dev-api
toggleBackgroundLayer
	"Toggles the dynamic filling of the maps background with the background tile"

	self tileMatrixStackBackground toggleVisibility.
	self 
		updateTilesBackground;
		changed
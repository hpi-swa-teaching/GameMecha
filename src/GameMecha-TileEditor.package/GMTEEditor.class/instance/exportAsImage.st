menu buttons
exportAsImage
	"Exports the current tile map as a png"
	
	exportTilemap := self tileMap veryDeepCopy.
	exportTilemap 
		hideHighlightingLayer;
		resetView;
		exportAsImage
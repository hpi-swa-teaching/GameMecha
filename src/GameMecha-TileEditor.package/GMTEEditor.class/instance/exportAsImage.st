accessing
exportAsImage
	"Exports the current tile map as a png"

	self tileMap 
		hideHighlightingLayer;
		resetView;
		exportAsImage;
		showHighlightingLayer
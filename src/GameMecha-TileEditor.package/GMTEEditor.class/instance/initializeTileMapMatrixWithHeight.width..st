initialization
initializeTileMapMatrixWithHeight: aHeight width: aWidth
	"Initializes the tileMap with a tile map with a certain height and width"
	
	self tileMap: (GMTEEditorTileMap tileWidth: aWidth tileHeight: aHeight padding: 0.15 sizeRatio: 1 model: self).
	self mapViewer addMorph: self tileMap.		
	self tileMap 
		position: (self tileMap owner position);
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		updateMap.
	self
		changed: #getGridWidthAsString;
		changed: #getGridHeightAsString;
		changed: #getPaddingAsString
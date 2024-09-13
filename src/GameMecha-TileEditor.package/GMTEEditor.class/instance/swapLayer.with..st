layer manipulation
swapLayer: anIndex with: anotherIndex
	"Swaps two layers"
	
	| selectionOfA |
	self tileMap tileMatrixStack swapLayer: anIndex with: anotherIndex.
	selectionOfA := self layerAt: anIndex.
	self 
		layerAt: anIndex put: (self layerAt: anotherIndex);
		layerAt: anotherIndex put: selectionOfA;
		changed: #getLayerList;
		changed: #layerAt:
instance creation
newFromEditableTileMap: aMap

	| newMap oldMapCopy |
	aMap tileSelectionSet clearAllHighlightings.
	
	oldMapCopy := aMap veryDeepCopy.
	
	newMap := (GMTETileMap newFrom: oldMapCopy)
		updateMap;
		hideHighlightingLayer;
		removeAllMorphs;
		yourself.
	
	oldMapCopy 
		submorphsDo: [:s | newMap addMorph: s];
	 	abandon.
	
	"Initially draw background tiles"
	newMap 
		updateTilesBackground;
		resetView;
		hasStaticView: true;
		reorderSubmorphsInLayers.
	
	^ newMap 
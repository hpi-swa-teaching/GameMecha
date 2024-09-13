event handling
mouseUp: anEvent
	"Apply brush operation on tilemap"
	
	| selectedIndices |
	"Make sure view is not currently moved. Implies that shift must still be held down"
	anEvent shiftPressed ifTrue: [^ nil].	

	self brush firstMatrixIndex: nil.
	
	selectedIndices := self brush outputSet asCollection.
	
	self updateTiles: selectedIndices inLayer: self selectedLayers anyOne FromEvent: anEvent.
	self brush resetOutputSet.
	
	(self previousTileStates isEmpty) ifFalse: [self saveTileEditChanges].
	self tileSelectionSet 
		clearAllHighlightings;
		highlightImage: (self model selectedTile)

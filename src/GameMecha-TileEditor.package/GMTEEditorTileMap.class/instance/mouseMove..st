event handling
mouseMove: anEvent
	"Implements highlighting of tiles when hovering"

	| activeLayer selectedIndices currentIndex |
	super mouseMove: anEvent.
	anEvent shiftPressed ifTrue: [^ nil].	

	self model singleLayerSelected ifFalse: [^ nil].
	
	activeLayer := self tileMatrixStack layer: self model selectedLayers anyOne.
	currentIndex := self tileIndexFromPosition: anEvent position.
	
	selectedIndices := self brush executeWithIndex: currentIndex andLayer: activeLayer.
	
	(anEvent redButtonPressed or: [anEvent yellowButtonPressed]) ifFalse: [self brush resetOutputSet].
	
	self highlightTilesFromIndices: selectedIndices
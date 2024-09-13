event handling
mouseDown: anEvent
	"Prepare the brush for next operation on self"

	| selectedIndex |
	self model singleLayerSelected ifFalse: [^ nil].
	
	selectedIndex := self tileIndexFromPosition: anEvent position.
	self brush firstMatrixIndex: selectedIndex.
	
	self brush executeWithIndex: selectedIndex andLayer: (self tileMatrixStack layer: self selectedLayers anyOne).
	anEvent yellowButtonPressed ifTrue: [self tileSelectionSet highlightImage: nil]
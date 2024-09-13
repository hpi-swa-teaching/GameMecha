layer manipulation
moveLayerDown
	"Moves the selected layer down by one"
	
	| selectedLayer |
	self singleLayerSelected ifFalse: [^ nil].
	
	selectedLayer := self getSelectedLayer.
	(selectedLayer == 1) ifFalse: [
		self 
			addCommand: (GMTEMoveLayerCommand fromLayerID: selectedLayer withDirection: -1 withEditor: self);
			swapLayer: selectedLayer with: selectedLayer - 1]
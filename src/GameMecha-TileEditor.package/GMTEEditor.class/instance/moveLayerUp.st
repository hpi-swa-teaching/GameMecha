layer manipulation
moveLayerUp
	"Moves the selected layer up by one"
	
	| selectedLayer |
	self singleLayerSelected ifFalse: [^ nil].
	
	selectedLayer := self getSelectedLayer.
	(selectedLayer == self layerCount) ifFalse: [
		self
			addCommand: (GMTEMoveLayerCommand fromLayerID: selectedLayer withDirection: 1 withEditor: self);
			swapLayer: selectedLayer with: selectedLayer + 1]
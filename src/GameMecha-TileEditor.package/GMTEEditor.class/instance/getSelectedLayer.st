layer manipulation
getSelectedLayer
	"Returns the selected layer, if only one is selected"
	
	self assert: self singleLayerSelected.
	^ self selectedLayers anyOne
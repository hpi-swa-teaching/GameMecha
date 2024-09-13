updating
toggleLayerVisibility: anIndex

	(self layerVisible: anIndex)
		ifTrue: [self hideLayer: anIndex]
		ifFalse: [self showLayer: anIndex]
	
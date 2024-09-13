adding
pushLayers: indexList

	| newLayer |
	indexList do: [:i |
		newLayer := (GMTETileMatrixLayer 
			width: self width 
			height: self height 
			layerIndex: (self morphicLayerStartingOffset - self layerCount - GMTETileMatrixStack morphicLayerDistance))
			displayName: 'Layer ', i;
			yourself.
		(i = 1)
			ifTrue: [self matrixLayers addFirst: newLayer]
			ifFalse: [self matrixLayers add: newLayer afterIndex: i-1]]
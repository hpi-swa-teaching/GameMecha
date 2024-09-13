layer manipulation
layerAt: anIndex put: aBool
	"(De-)Selects this layer"
	
	| multiSelection |
	multiSelection := Sensor shiftPressed.
	
	multiSelection ifFalse: [self selectedLayers removeAll].
	
	(aBool or: [multiSelection not])
		ifTrue: [self selectLayer: anIndex]
		ifFalse: [self deselectLayer: anIndex]
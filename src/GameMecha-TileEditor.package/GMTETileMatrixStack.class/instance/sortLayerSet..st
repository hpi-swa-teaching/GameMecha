multiselect-helpers
sortLayerSet: aSet
	"Defines order of how layerIndex sets are supposed to be sorted and updated to save on index updates"

	| layerCollection |
	
	layerCollection := SortedCollection new.
	aSet do: [:layerIndex | 
		layerCollection add: layerIndex].
	^ layerCollection reverse
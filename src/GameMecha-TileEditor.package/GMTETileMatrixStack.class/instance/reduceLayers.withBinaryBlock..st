multiselect-helpers
reduceLayers: anOrderedCollection withBinaryBlock: aBlock
	"Run a binary aBlock over anOrderedCollection and reduce to a single return value"

	| tmpResult |
	self assert: (anOrderedCollection size > 1) description: 'Reduce expects at least 2 elements'.
	
	tmpResult := aBlock value: (anOrderedCollection at: 1) value: (anOrderedCollection at: 2).
	
	3 to: anOrderedCollection size do: [:layerIndex |
		tmpResult := aBlock value: tmpResult value: (anOrderedCollection at: layerIndex)].

	^ tmpResult
	
	
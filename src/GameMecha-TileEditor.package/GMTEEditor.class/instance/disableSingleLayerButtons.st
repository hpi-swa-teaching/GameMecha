button manipulation
disableSingleLayerButtons
	"Disables buttons assigned to actions that are only valid on singular layers"

	GMTEEditor singleLayerActionNames do: [:aString | (self associatedMorph submorphNamed: aString) enabled: false]
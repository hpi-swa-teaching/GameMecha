button manipulation
updateButtonEnabled
	"Updates the states of layer buttons, depending on whether they shoudld be enabled or not"

	self associatedMorph ifNil: [^ nil].

	self singleLayerSelected
		ifTrue: [self enableSingleLayerButtons]
		ifFalse: [self disableSingleLayerButtons].
		
	(self layerAt: 1) "Don't delete the first layer"
		ifTrue: [(self associatedMorph submorphNamed: 'buttonDeleteLayers') enabled: false]
		ifFalse: [(self associatedMorph submorphNamed: 'buttonDeleteLayers') enabled: true]
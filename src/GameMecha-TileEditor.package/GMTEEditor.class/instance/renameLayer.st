layer manipulation
renameLayer
	"Renames the selected layer with a user chosen name"
	
	| newName selectedLayer |
	self singleLayerSelected
		ifTrue: [
			selectedLayer := self getSelectedLayer.
			newName := FillInTheBlankMorph 
			request: 'New Name:' initialAnswer: (self tileMap tileMatrixStack layerNameOf: selectedLayer).
			(newName isNil or: newName isEmpty)
				ifFalse: [self tileMap tileMatrixStack setLayerNameOf: selectedLayer to: newName]].
	self changed: #getLayerList

	
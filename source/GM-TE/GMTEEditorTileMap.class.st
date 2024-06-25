Class {
	#name : #GMTEEditorTileMap,
	#superclass : #GMTETileMap,
	#instVars : [
		'tileSelectionSet',
		'model'
	],
	#category : #'GM-TE-TileMap'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jj 6/23/2024 13:36'
}
GMTEEditorTileMap class >> tileWidth: aWidth tileHeight: aHeight padding: aPadding sizeRatio: aRatio model: aModel [
	
	^ (self new)
		setDimensionsWidth: aWidth height: aHeight padding: aPadding;
		tileSizeRatio: aRatio;
		model: aModel
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'jj 6/23/2024 13:35'
}
GMTEEditorTileMap >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'jj 6/23/2024 13:35'
}
GMTEEditorTileMap >> handlesMouseMove: anEvent [

	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TW 6/22/2024 01:25'
}
GMTEEditorTileMap >> initialize [

	super initialize.
	self tileSelectionSet: GMTETileSelectionSet new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/23/2024 13:35'
}
GMTEEditorTileMap >> model [

	^ model
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:25'
}
GMTEEditorTileMap >> model: anObject [

	model := anObject
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:34'
}
GMTEEditorTileMap >> mouseDown: anEvent [
	"Implements placement of tiles"

	| clickedTile activeLayer |
	self model singleLayerSelected 
		ifTrue: [
			activeLayer := self model selectedLayers anyOne.
			clickedTile := self tileFromPosition: anEvent position layer: activeLayer.
			self updateTile: clickedTile inLayer: activeLayer FromEvent: anEvent].
	
	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:34'
}
GMTEEditorTileMap >> mouseMove: anEvent [
	"Implements highlighting of tiles when hovering"

	| hoveredTile hoveredTileHighlighting activeLayer |
	self model singleLayerSelected
		ifTrue: [activeLayer := self model selectedLayers anyOne.
	
		hoveredTile := self tileFromPosition: anEvent position layer: activeLayer.
		hoveredTileHighlighting := self highlightingTileFromPosition: anEvent position.
	
		self tileSelectionSet clearAllHighlightings.
	
		hoveredTileHighlighting ifNotNil: [self tileSelectionSet highlightTile: hoveredTileHighlighting].
	
		"TODO why another ifNil check here?"
		self updateTile: hoveredTile inLayer: activeLayer FromEvent: anEvent]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:35'
}
GMTEEditorTileMap >> rescaleMap [
	"Override super behavior such that highlightings are removed during rescale events"

	self tileSelectionSet clearAllHighlightings.
	super rescaleMap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/23/2024 13:35'
}
GMTEEditorTileMap >> tileSelectionSet [

	^ tileSelectionSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:25'
}
GMTEEditorTileMap >> tileSelectionSet: anObject [

	tileSelectionSet := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:38'
}
GMTEEditorTileMap >> updateTile: aTile inLayer: aLayer FromEvent: anEvent [
	"Add currently selected tile (model) to editable matrix stack at mouse position"
	
	| tileIndex hoveredTile |
	hoveredTile := aTile.
	
	(anEvent redButtonPressed and: [self model selectedTile notNil]) 
		ifTrue: [ 
			"Add tile if nil at mouse position"
			hoveredTile ifNil: [
				tileIndex := self tileIndexFromPosition: anEvent position.
				tileIndex ifNil: [^ nil].
				hoveredTile := self generateTileAtlayer: aLayer x: tileIndex x y: tileIndex y stack: self tileMatrixStack tileType: GMTETile]. 
			"Set tile to currently selected tile"
			self updateTileSprite: hoveredTile.
			self model savedSinceModified: false].
	
	((anEvent yellowButtonPressed) and: [hoveredTile notNil]) 
		ifTrue: [
			"Remove tile if any present at mouse position"
			aLayer ifNotNil: [
				tileIndex := self tileIndexFromPosition: anEvent position.
				self tileMatrixStack layer: aLayer at: tileIndex y at: tileIndex x put: nil.
				hoveredTile abandon].
			self model savedSinceModified: false]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Alex M 6/25/2024 18:08'
}
GMTEEditorTileMap >> updateTileSprite: aTile [
	"Helper function to apply sprite from tile selection to aTile"

	self model selectedTile ifNotNil: [aTile updateSprite: self model selectedTile]
]

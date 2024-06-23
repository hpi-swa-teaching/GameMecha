Class {
	#name : #GMTEEditorTileMap,
	#superclass : #GMTETileMap,
	#instVars : [
		'tileSelectionSet',
		'model'
	],
	#category : #'GM-TE-Core'
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
	#'squeak_changestamp' : 'TW 6/20/2024 21:47'
}
GMTEEditorTileMap >> blendLayers: aSet [

	self tileMatrixStack blendLayers: aSet
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
	#category : #'as yet unclassified',
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
	#'squeak_changestamp' : 'jj 6/23/2024 13:36'
}
GMTEEditorTileMap >> mouseDown: anEvent [

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
	#'squeak_changestamp' : 'jj 6/23/2024 13:35'
}
GMTEEditorTileMap >> mouseMove: anEvent [

	| hoveredTile hoveredTileVisual activeLayer |
	self model singleLayerSelected
		ifTrue: [activeLayer := self model selectedLayers anyOne.
	
		hoveredTile := self tileFromPosition: anEvent position layer: activeLayer.
		hoveredTileVisual := self tileVisualFromPosition: anEvent position.
	
		self tileSelectionSet clearAllHighlightings.
	
		hoveredTileVisual ifNotNil: [self tileSelectionSet highlightTile: hoveredTileVisual].
	
		"TODO why another ifNil check here?"
		self updateTile: hoveredTile inLayer: activeLayer FromEvent: anEvent]
	
	"This solves the bug but not the root of the issue. TODO further investigation."
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 6/20/2024 21:57'
}
GMTEEditorTileMap >> removeLayers: aSet [

	self tileMatrixStack removeLayersAt: aSet
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 6/15/2024 12:41'
}
GMTEEditorTileMap >> rescaleMap [

	self tileSelectionSet clearAllHighlightings.
	super rescaleMap
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 6/20/2024 21:45'
}
GMTEEditorTileMap >> resetAllLayers: aSet [

	self tileMatrixStack reset
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 6/20/2024 21:42'
}
GMTEEditorTileMap >> resetLayers: aSet [

	self tileMatrixStack resetLayers: aSet
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
	#'squeak_changestamp' : 'jj 6/23/2024 13:36'
}
GMTEEditorTileMap >> updateTile: aTile inLayer: aLayer FromEvent: anEvent [
	
	| tileIdx hoveredTile |
	hoveredTile := aTile.
	
	(anEvent redButtonPressed and: [self model selectedTile notNil]) 
		ifTrue: [ 
			"Add tile if nil at mouse position"
			hoveredTile ifNil: [
				tileIdx := self tileIdxFromPosition: anEvent position.
				tileIdx ifNil: [^ nil].
				hoveredTile := self generateTileAtlayer: aLayer x: tileIdx x y: tileIdx y stack: self tileMatrixStack tileType: GMTETile]. 
			"Set tile to currently selected tile"
			self updateTileSprite: hoveredTile.
			self model savedSinceModified: false].
	
	((anEvent yellowButtonPressed) and: [hoveredTile notNil]) 
		ifTrue: [
			"Remove tile if any present at mouse position"
			aLayer ifNotNil: [
				tileIdx := self tileIdxFromPosition: anEvent position.
				self tileMatrixStack layer: aLayer at: tileIdx y at: tileIdx x put: nil.
				hoveredTile abandon].
			self model savedSinceModified: false]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:41'
}
GMTEEditorTileMap >> updateTileSprite: aTile [

	self model selectedTile ifNotNil: [aTile applyTileSprite: self model selectedTile]
]
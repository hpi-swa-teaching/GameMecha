Class {
	#name : #GMTEEditorTileMap,
	#superclass : #GMTETileMap,
	#instVars : [
		'tileSelectionSet',
		'model',
		'previousTileStates',
		'currentTileChanges'
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
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/12/2024 14:48'
}
GMTEEditorTileMap >> brush [

	^ model brush
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:15'
}
GMTEEditorTileMap >> currentTileChanges [

	^ currentTileChanges
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:18'
}
GMTEEditorTileMap >> currentTileChanges: aTileDictionary [

	currentTileChanges := aTileDictionary
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:21'
}
GMTEEditorTileMap >> deleteTiles: anIndexSet inLayer: aLayer [
	"delete tiles from editable matrix stack at given indices"
	
	| tile |
	anIndexSet do: [:c |
		((self tileMatrixStack layer: aLayer) inBounds: c) ifTrue: [
			tile := self tileMatrixStack layer: aLayer at: c y at: c x.
			tile	ifNotNil: [ 
				self savePreviousImageFromIndex: c inLayer: aLayer.
				tile abandon.
				self tileMatrixStack layer: aLayer at: c y at: c x put: nil.
				self saveNewImageFromPosition: tile position inLayer: aLayer]]].
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
	#category : #'event handling',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/11/2024 17:14'
}
GMTEEditorTileMap >> handlesMouseOver: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JS 7/12/2024 15:15'
}
GMTEEditorTileMap >> highlightTilesFromIndices: anIndexSet [
	
	| hoveredHighlightingTile |
	self tileSelectionSet clearAllHighlightings.
	anIndexSet ifNil: [^ nil].
	
	(anIndexSet select: [:c | 
		(self tileMatrixStack layer: self model selectedLayers anyOne) inBounds: c]) do: [:t |
			hoveredHighlightingTile := self highlightingTileFromIndex: t.
			hoveredHighlightingTile ifNotNil: [self tileSelectionSet highlightTile: hoveredHighlightingTile]]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Alex M 6/28/2024 20:24'
}
GMTEEditorTileMap >> initialize [

	super initialize.
	self
		tileSelectionSet: (GMTETileSelectionSet new);
		previousTileStates: Dictionary new;
		currentTileChanges: Dictionary new
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
	#'squeak_changestamp' : 'JS 7/12/2024 15:19'
}
GMTEEditorTileMap >> mouseDown: anEvent [

	| selectedIndex |
	self model singleLayerSelected ifFalse: [^ nil].
	
	selectedIndex := self tileIndexFromPosition: anEvent position.
	self brush firstMatrixIndex: selectedIndex.
	
	self brush executeWithMatrixIndex: selectedIndex andLayer: (self tileMatrixStack layer: self selectedLayers anyOne).
	anEvent yellowButtonPressed ifTrue: [self tileSelectionSet highlightImage: nil]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JS 7/12/2024 15:18'
}
GMTEEditorTileMap >> mouseLeave: anEvent [

	self tileSelectionSet clearAllHighlightings
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JS 7/12/2024 15:17'
}
GMTEEditorTileMap >> mouseMove: anEvent [
	"Implements highlighting of tiles when hovering"

	| activeLayer selectedIndices |
	self model singleLayerSelected ifFalse: [^ nil].
	
	activeLayer := self tileMatrixStack layer: self model selectedLayers anyOne.
	selectedIndices := self model brush executeWithMatrixIndex: (self tileIndexFromPosition: anEvent position) andLayer: activeLayer.
	
	(anEvent redButtonPressed or: [anEvent yellowButtonPressed]) ifFalse: [self model brush resetOutputSet].
	
	self highlightTilesFromIndices: selectedIndices
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JS 7/12/2024 15:23'
}
GMTEEditorTileMap >> mouseUp: anEvent [
	
	| selectedIndices |
	self brush firstMatrixIndex: nil.
	
	selectedIndices := self brush outputSet asCollection.
	
	self updateTiles: selectedIndices inLayer: self selectedLayers anyOne FromEvent: anEvent.
	self model brush resetOutputSet.
	
	(self previousTileStates isEmpty) ifFalse: [self saveTileEditChanges].
	self tileSelectionSet clearAllHighlightings;
							highlightImage: (self model selectedTile)

]

{
	#category : #updating,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:21'
}
GMTEEditorTileMap >> placeTiles: aCoordinateCollection inLayer: aLayer [
	"Add currently selected tile (model) to editable matrix stack at given indices"
	
	| tile |
	aCoordinateCollection do: [:c |
		self savePreviousImageFromIndex: c inLayer: aLayer.
		((self tileMatrixStack layer: aLayer) inBounds: c) ifTrue: [
				tile := self tileMatrixStack layer: aLayer at: c y at: c x.
				tile ifNil: [ tile := self generateTileAtlayer: aLayer x: c x y: c y stack: tileMatrixStack tileType: GMTETile].
				self updateTileSprite: tile.
				self saveNewImageFromPosition: tile position inLayer: aLayer]].
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:16'
}
GMTEEditorTileMap >> previousTileStates [

	^ previousTileStates
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:18'
}
GMTEEditorTileMap >> previousTileStates: aTileDictionary [

	previousTileStates := aTileDictionary
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
	#category : #TODO,
	#'squeak_changestamp' : 'Alex M 7/3/2024 23:50'
}
GMTEEditorTileMap >> resetLayers: aSet [
	| layer |
	
	aSet do: [:layerIndex |
		layer := self tileMatrixStack layer: layerIndex.
		layer withIndicesDo: [:tile :y :x |
			tile ifNotNil: [self previousTileStates at: {x. y. layerIndex} ifAbsentPut: tile fullResolutionSprite.
				self currentTileChanges at: {x. y. layerIndex} put: nil]].
		self tileMatrixStack resetLayer: layerIndex].
	
	self saveTileEditChanges
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Alex M 6/28/2024 20:06'
}
GMTEEditorTileMap >> resetTileEditChanges [

	self previousTileStates: Dictionary new.
	self currentTileChanges: Dictionary new
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:20'
}
GMTEEditorTileMap >> saveNewImageFromIndex: aCoordinate inLayer: aLayer [
	| tile | 
	
	tile := self tileMatrixStack layer: aLayer at: aCoordinate y at: aCoordinate x.
	
	tile
		ifNil: [self currentTileChanges at: {aCoordinate x. aCoordinate y. aLayer} put: nil]
		ifNotNil: [self currentTileChanges at: {aCoordinate x. aCoordinate y. aLayer} put: tile fullResolutionSprite]
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:20'
}
GMTEEditorTileMap >> saveNewImageFromPosition: aPosition inLayer: aLayer [
	
	self saveNewImageFromIndex: (self tileIndexFromPosition: aPosition) inLayer: aLayer
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:20'
}
GMTEEditorTileMap >> savePreviousImageFromIndex: aCoordinate inLayer: aLayer [
	| tile | 
	
	tile := self tileMatrixStack layer: aLayer at: aCoordinate y at: aCoordinate x.
	
	tile
		ifNil: [self previousTileStates at: {aCoordinate x. aCoordinate y. aLayer} ifAbsentPut: nil]
		ifNotNil: [self previousTileStates at: {aCoordinate x. aCoordinate y. aLayer} ifAbsentPut: tile fullResolutionSprite]
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:20'
}
GMTEEditorTileMap >> savePreviousImageFromPosition: aPosition inLayer: aLayer [
	
	self savePreviousImageFromIndex: (self tileIndexFromPosition: aPosition) inLayer: aLayer
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'JS 7/11/2024 14:07'
}
GMTEEditorTileMap >> saveTileEditChanges [

	self 
		model addCommand: (GMTEEditTilesCommand previousTiles: self previousTileStates currentTiles: self currentTileChanges tilemap: self).
	self resetTileEditChanges.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/12/2024 14:49'
}
GMTEEditorTileMap >> selectedLayers [

	^ model selectedLayers
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
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:16'
}
GMTEEditorTileMap >> tileSelectionSet: aSet [

	tileSelectionSet := aSet
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Alex M 6/25/2024 18:08'
}
GMTEEditorTileMap >> updateTileSprite: aTile [
	"Helper function to apply sprite from tile selection to aTile"

	self model selectedTile ifNotNil: [aTile updateSprite: self model selectedTile]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 14:13'
}
GMTEEditorTileMap >> updateTiles: anIndexSet inLayer: aLayer FromEvent: anEvent [
	
	(self tileIndexFromPosition: anEvent position) ifNil: [^ nil].
	
	(anEvent redButtonChanged and: [self model selectedTile notNil]) ifTrue: [self placeTiles: anIndexSet inLayer: aLayer].	
	(anEvent yellowButtonChanged) ifTrue: [self deleteTiles: anIndexSet inLayer: aLayer].
	
	self model savedSinceModified: false
]

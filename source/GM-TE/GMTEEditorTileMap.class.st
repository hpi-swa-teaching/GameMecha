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
	#category : #TODO,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/5/2024 17:07'
}
GMTEEditorTileMap >> calculateTileCollectionFromPosition: aPos andLayer: aLayer [

	| index rawCollection resultCollection |
	self flag: 'remove method'.
	index := self tileIndexFromPosition: aPos.
	index ifNil: [^ nil].
	rawCollection := OrderedCollection new.
	resultCollection := OrderedCollection new.
	self flag: 'Add different algos'.
	rawCollection add: (self tileMatrixStack layer: aLayer at: index y at: index x).
	self halt.

	rawCollection add: (self tileMatrixStack layer: aLayer at: index y at: ((index x)+1)).
	rawCollection do: [:t |
		t ifNil: [resultCollection add: (self generateTileAtlayer: aLayer x: index x y: index y stack: self tileMatrixStack tileType: GMTETile)].
		t ifNotNil: [resultCollection add: t]
	].
	^ resultCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 19:28'
}
GMTEEditorTileMap >> currentTileChanges [
	^ currentTileChanges
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 19:28'
}
GMTEEditorTileMap >> currentTileChanges: anObject [
	currentTileChanges := anObject
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
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 13:12'
}
GMTEEditorTileMap >> handlesMouseOver: anEvent [

	^ true
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
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 21:46'
}
GMTEEditorTileMap >> mouseDown: anEvent [
	"Implements placement of tiles"

	| selectedCoordinates activeLayer selectedIndex |
	self flag: 'refactor; method extraction for "Add tiles to layer" to minimize redundancy with mouseMove?'.
	self model singleLayerSelected ifFalse: [^nil].
	activeLayer := self model selectedLayers anyOne.
	selectedIndex := self tileIndexFromPosition: anEvent position.
	self model brush firstMatrixIndex: selectedIndex.
	selectedCoordinates := self model brush executeWithMatrixIndex: selectedIndex andLayer: (self tileMatrixStack layer: activeLayer).
	"self updateTiles: selectedCoordinates inLayer: activeLayer FromEvent: anEvent."
	
	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 13:14'
}
GMTEEditorTileMap >> mouseLeave: anEvent [

	self tileSelectionSet clearAllHighlightings
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 22:02'
}
GMTEEditorTileMap >> mouseMove: anEvent [
	"Implements highlighting of tiles when hovering"

	| hoveredTileHighlighting activeLayer selectedCoordinates |
	self model singleLayerSelected ifFalse: [^ nil].
	
	activeLayer := self model selectedLayers anyOne.
	selectedCoordinates := self model brush executeWithMatrixIndex: (self tileIndexFromPosition: anEvent position) andLayer: (self tileMatrixStack layer: activeLayer).
	(anEvent redButtonPressed or: [anEvent yellowButtonPressed]) ifFalse: [self model brush resetOutputSet].
	self tileSelectionSet clearAllHighlightings.
	
	selectedCoordinates ifNil: [
		^ nil].
	
	(selectedCoordinates select: [:c | (self tileMatrixStack layer: activeLayer) inBounds: c]) do: [:c|
		hoveredTileHighlighting := self highlightingTileFromIndex: c.
		hoveredTileHighlighting ifNotNil: [self tileSelectionSet highlightTile: hoveredTileHighlighting]].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 22:13'
}
GMTEEditorTileMap >> mouseUp: anEvent [
	
	| indicesToAdd activeLayer |
	self model brush firstMatrixIndex: nil.
	indicesToAdd := self model brush outputSet.
	activeLayer := self model selectedLayers anyOne.
	self updateTiles: (indicesToAdd asCollection) inLayer: activeLayer FromEvent: anEvent.
	self model brush resetOutputSet.
	(self previousTileStates size > 0) ifTrue: [self saveTileEditChanges]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 19:44'
}
GMTEEditorTileMap >> previousTileStates [
	^ previousTileStates
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/28/2024 19:44'
}
GMTEEditorTileMap >> previousTileStates: anObject [
	previousTileStates := anObject
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
	#'squeak_changestamp' : 'Alex M 7/6/2024 01:31'
}
GMTEEditorTileMap >> saveNewImageFromCoordinate: aCoordinate inLayer: aLayer [
	| tile | 
	
	tile := self tileMatrixStack layer: aLayer at: aCoordinate y at: aCoordinate x.
	
	tile
		ifNil: [self currentTileChanges at: {aCoordinate x. aCoordinate y. aLayer} put: nil]
		ifNotNil: [self currentTileChanges at: {aCoordinate x. aCoordinate y. aLayer} put: tile fullResolutionSprite]
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Alex M 7/6/2024 01:34'
}
GMTEEditorTileMap >> saveNewImageFromPosition: aPosition inLayer: aLayer [
	
	self saveNewImageFromCoordinate: (self tileIndexFromPosition: aPosition) inLayer: aLayer
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Alex M 7/6/2024 01:54'
}
GMTEEditorTileMap >> savePreviousImageFromCoordinate: aCoordinate inLayer: aLayer [
	| tile | 
	
	tile := self tileMatrixStack layer: aLayer at: aCoordinate y at: aCoordinate x.
	
	tile
		ifNil: [self previousTileStates at: {aCoordinate x. aCoordinate y. aLayer} ifAbsentPut: nil]
		ifNotNil: [self previousTileStates at: {aCoordinate x. aCoordinate y. aLayer} ifAbsentPut: tile fullResolutionSprite]
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 11:46'
}
GMTEEditorTileMap >> savePreviousImageFromMatrixCoordinate: aCoordinate inLayer: aLayer [
	| tile |
	
	tile := self tileMatrixStack layer: aLayer at: aCoordinate y at: aCoordinate x.
	
	tile
		ifNil: [self previousTileStates at: {aCoordinate x. aCoordinate y. aLayer} ifAbsentPut: nil]
		ifNotNil: [self previousTileStates at: {aCoordinate x. aCoordinate y. aLayer} ifAbsentPut: tile fullResolutionSprite]
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 11:58'
}
GMTEEditorTileMap >> savePreviousImageFromPosition: aPosition inLayer: aLayer [
	
	self savePreviousImageFromCoordinate: (self tileIndexFromPosition: aPosition) inLayer: aLayer
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 11:52'
}
GMTEEditorTileMap >> saveTileEditChanges [

	self 
		model addCommand: (GMTEEditTilesCommand previousTiles: previousTileStates currentTiles: currentTileChanges tilemap: self).
	self resetTileEditChanges.
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
	#'squeak_changestamp' : 'Alex M 6/25/2024 18:08'
}
GMTEEditorTileMap >> updateTileSprite: aTile [
	"Helper function to apply sprite from tile selection to aTile"

	self model selectedTile ifNotNil: [aTile updateSprite: self model selectedTile]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/9/2024 22:07'
}
GMTEEditorTileMap >> updateTiles: aCoordinateCollection inLayer: aLayer FromEvent: anEvent [
	"Add currently selected tile (model) to editable matrix stack at mouse position"
	| tile |
	self flag: 'saveNewImage confict with alex fix?'.
	(self tileIndexFromPosition: anEvent position) ifNil: [^ nil].
	(anEvent redButtonChanged and: [self model selectedTile notNil]) 
		ifTrue: [
			aCoordinateCollection do: [:c |
				self savePreviousImageFromMatrixCoordinate: c inLayer: aLayer.
				((self tileMatrixStack layer: aLayer) inBounds: c) ifTrue: [
					tile := self tileMatrixStack layer: aLayer at: c y at: c x.
					tile
						ifNil: [ tile := self generateTileAtlayer: aLayer x: c x y: c y stack: tileMatrixStack tileType: GMTETile].
					self updateTileSprite: tile.
					self saveNewImageFromPosition: tile position inLayer: aLayer]
				].
			self model savedSinceModified: false].
	(anEvent yellowButtonChanged) 
		ifTrue: [
			aCoordinateCollection do: [:c |
				| tilePos |
				self savePreviousImageFromMatrixCoordinate: c inLayer: aLayer.
				((self tileMatrixStack layer: aLayer) inBounds: c) ifTrue: [
					tile := self tileMatrixStack layer: aLayer at: c y at: c x.
					tile
						ifNotNil: [ 
							tilePos := tile position.
							tile abandon.
							self tileMatrixStack layer: aLayer at: c y at: c x put: nil.
							self saveNewImageFromPosition: tilePos inLayer: aLayer].
					]
				].
			self model savedSinceModified: false]
]

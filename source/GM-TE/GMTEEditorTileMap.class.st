"
A GMTEEditorTileMap is a Tilemap that can only be found in the editor or as an exported .morph file. It provides the additional methods for i/o compared to the regular tilemap.
"
Class {
	#name : #GMTEEditorTileMap,
	#superclass : #GMTETileMap,
	#instVars : [
		'tileSelectionSet',
		'model',
		'previousTileStates',
		'currentTileChanges'
	],
	#category : #'GM-TE-TileMap',
	#'squeak_changestamp' : 'JS 7/12/2024 17:04'
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
	#'squeak_changestamp' : 'JS 7/12/2024 16:55'
}
GMTEEditorTileMap >> brush [

	^ self model brush
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
	#'squeak_changestamp' : 'Alex M 7/12/2024 17:16'
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
				self saveNewImageFromIndex: c inLayer: aLayer.
				self model savedSinceModified: false]]]
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
	#category : #updating,
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
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 17:04'
}
GMTEEditorTileMap >> initialize [

	super initialize.
	self
		tileSelectionSet: (GMTETileSelectionSet new);
		previousTileStates: Dictionary new;
		currentTileChanges: Dictionary new;
		hasStaticView: false
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
	#'squeak_changestamp' : 'JS 7/12/2024 16:25'
}
GMTEEditorTileMap >> model: aModel [

	model := aModel
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JS 7/12/2024 16:50'
}
GMTEEditorTileMap >> mouseDown: anEvent [
	"prepare the brush for next operation on self"

	| selectedIndex |
	self model singleLayerSelected ifFalse: [^ nil].
	
	selectedIndex := self tileIndexFromPosition: anEvent position.
	self brush firstMatrixIndex: selectedIndex.
	
	self brush executeWithIndex: selectedIndex andLayer: (self tileMatrixStack layer: self selectedLayers anyOne).
	anEvent yellowButtonPressed ifTrue: [self tileSelectionSet highlightImage: nil]
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JS 7/12/2024 16:27'
}
GMTEEditorTileMap >> mouseLeave: anEvent [
	
	self tileSelectionSet clearAllHighlightings
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 17:20'
}
GMTEEditorTileMap >> mouseMove: anEvent [
	"implements highlighting of tiles when hovering"

	| activeLayer selectedIndices currentIndex |
	super mouseMove: anEvent.
	anEvent shiftPressed ifTrue: [^ nil].	

	self model singleLayerSelected ifFalse: [^ nil].
	
	activeLayer := self tileMatrixStack layer: self model selectedLayers anyOne.
	currentIndex := self tileIndexFromPosition: anEvent position.
	
	selectedIndices := self brush executeWithIndex: currentIndex andLayer: activeLayer.
	
	(anEvent redButtonPressed or: [anEvent yellowButtonPressed]) ifFalse: [self brush resetOutputSet].
	
	self highlightTilesFromIndices: selectedIndices
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'JS 7/12/2024 16:28'
}
GMTEEditorTileMap >> mouseUp: anEvent [
	"apply brush operation on tilemap"
	
	| selectedIndices |
	self brush firstMatrixIndex: nil.
	
	selectedIndices := self brush outputSet asCollection.
	
	self updateTiles: selectedIndices inLayer: self selectedLayers anyOne FromEvent: anEvent.
	self brush resetOutputSet.
	
	(self previousTileStates isEmpty) ifFalse: [self saveTileEditChanges].
	self tileSelectionSet 
		clearAllHighlightings;
		highlightImage: (self model selectedTile)

]

{
	#category : #updating,
	#'squeak_changestamp' : 'Alex M 7/12/2024 17:15'
}
GMTEEditorTileMap >> placeTiles: aCoordinateCollection inLayer: aLayer [
	"add currently selected tile (model) to editable matrix stack at given indices"
	
	| tile |
	aCoordinateCollection do: [:c |
		self savePreviousImageFromIndex: c inLayer: aLayer.
		((self tileMatrixStack layer: aLayer) inBounds: c) ifTrue: [
				tile := self tileMatrixStack layer: aLayer at: c y at: c x.
				tile ifNil: [tile := self generateTileAtlayer: aLayer x: c x y: c y stack: tileMatrixStack tileType: GMTETile].
				self model selectedTile ifNotNil: [tile updateSprite: self model selectedTile].
				self saveNewImageFromIndex: c inLayer: aLayer.
				self model savedSinceModified: false]]
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
	#category : #updating,
	#'squeak_changestamp' : 'JS 7/12/2024 16:31'
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
	#'squeak_changestamp' : 'JS 7/12/2024 16:34'
}
GMTEEditorTileMap >> saveNewImageFromIndex: anIndex inLayer: aLayer [
	
	| tile | 
	tile := self tileMatrixStack layer: aLayer at: anIndex y at: anIndex x.

	tile
		ifNil: [self currentTileChanges at: {anIndex x. anIndex y. aLayer} put: nil]
		ifNotNil: [self currentTileChanges at: {anIndex x. anIndex y. aLayer} put: tile fullResolutionSprite]
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'JS 7/12/2024 16:40'
}
GMTEEditorTileMap >> savePreviousImageFromIndex: anIndex inLayer: aLayer [

	| tile | 	
	tile := self tileMatrixStack layer: aLayer at: anIndex y at: anIndex x.
	
	tile
		ifNil: [self previousTileStates at: {anIndex x. anIndex y. aLayer} ifAbsentPut: nil]
		ifNotNil: [self previousTileStates at: {anIndex x. anIndex y. aLayer} ifAbsentPut: tile fullResolutionSprite]
]

{
	#category : #'command processing',
	#'squeak_changestamp' : 'JS 7/12/2024 16:43'
}
GMTEEditorTileMap >> saveTileEditChanges [
	
	| command |
	command := GMTEEditTilesCommand previousTiles: self previousTileStates currentTiles: self currentTileChanges tilemap: self.
	
	self model addCommand: command.
	self resetTileEditChanges
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 7/12/2024 16:55'
}
GMTEEditorTileMap >> selectedLayers [

	^ self model selectedLayers
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
	#'squeak_changestamp' : 'Alex M 7/12/2024 17:14'
}
GMTEEditorTileMap >> updateTiles: anIndexSet inLayer: aLayer FromEvent: anEvent [
	
	| validLeftClick validRightClick |
	(self tileIndexFromPosition: anEvent position) ifNil: [^ nil].
	
	validLeftClick := anEvent redButtonChanged and: [self model selectedTile notNil].
	validRightClick := anEvent yellowButtonChanged.
	
	validLeftClick ifTrue: [self placeTiles: anIndexSet inLayer: aLayer].	
	validRightClick ifTrue: [self deleteTiles: anIndexSet inLayer: aLayer].
]

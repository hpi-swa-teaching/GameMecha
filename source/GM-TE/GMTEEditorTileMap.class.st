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
	#'squeak_changestamp' : 'JS 6/4/2024 16:56'
}
GMTEEditorTileMap class >> tileWidth: aWidth tileHeight: aHeight padding: aPadding sizeRatio: aRatio model: aModel [
	
	^ self new
		setDimensionsWidth: aWidth height: aHeight padding: aPadding;
		tileSizeRatio: aRatio;
		model: aModel.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 5/22/2024 18:32'
}
GMTEEditorTileMap >> handlesMouseDown: anEvent [
	"TODO: make this useful."
	^ true.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Alex M 5/22/2024 19:47'
}
GMTEEditorTileMap >> handlesMouseMove: anEvent [
	"TODO: make this useful."
	^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TW 5/22/2024 15:48'
}
GMTEEditorTileMap >> initialize [

	super initialize.
	self tileSelectionSet: GMTETileSelectionSet new.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 16:45'
}
GMTEEditorTileMap >> model [

	^model
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 16:40'
}
GMTEEditorTileMap >> model: anObject [

	model := anObject.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 6/20/2024 16:35'
}
GMTEEditorTileMap >> mouseDown: anEvent [
	"TODO: make this useful."
	
	| clickedTile activeLayer|
	
	self model singleLayerSelected 
		ifTrue: [activeLayer := self model selectedLayers anyOne.
	
		clickedTile := self tileFromPosition: anEvent position layer: activeLayer.
	
		self updateTile: clickedTile inLayer: activeLayer FromEvent: anEvent].
	
	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 6/20/2024 16:35'
}
GMTEEditorTileMap >> mouseMove: anEvent [

	| hoveredTile hoveredTileVisual activeLayer |

	self model singleLayerSelected
		ifTrue: [activeLayer := self model selectedLayers anyOne.
	
		hoveredTile := self tileFromPosition: anEvent position layer: activeLayer.
		hoveredTileVisual := self tileVisualFromPosition: anEvent position.
	
		self tileSelectionSet clearAllHighlightings.
	
		hoveredTileVisual 
			ifNotNil: [self tileSelectionSet highlightTile: hoveredTileVisual].
	
		"TODO why another ifNil check here?"
		self updateTile: hoveredTile inLayer: activeLayer FromEvent: anEvent]
	
	"This solves the bug but not the root of the issue. TODO further investigation."
	"self updateTiles."
	"hoveredTileVisual
		extent: self tileSizeWidth@self tileSizeHeight;
		borderColor: Color white;
		color: Color veryLightGray;
		borderWidth: 2"
]

{
	#category : #updating,
	#'squeak_changestamp' : 'JS 6/15/2024 12:41'
}
GMTEEditorTileMap >> rescaleMap [

	self tileSelectionSet clearAllHighlightings.
	super rescaleMap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 15:49'
}
GMTEEditorTileMap >> tileSelectionSet [

	^ tileSelectionSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 15:49'
}
GMTEEditorTileMap >> tileSelectionSet: anObject [

	tileSelectionSet := anObject.
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:42'
}
GMTEEditorTileMap >> updateTile: aTile inLayer: aLayer FromEvent: anEvent [
	| tileIdx hoveredTile |
	
	hoveredTile := aTile.
	
	(anEvent redButtonPressed and: [self model selectedTile notNil]) 
	ifTrue: [ hoveredTile 
		ifNil: [
			tileIdx := self tileIdxFromPosition: anEvent position.
			tileIdx ifNil: [^nil].
			hoveredTile := self generateTileAtlayer: aLayer x: tileIdx x y: tileIdx y stack: self tileMatrixStack tileType: GMTETile.]. 
		self updateTileSpriteFromModel: hoveredTile.
		self model savedSinceModified: false].
	
	((anEvent yellowButtonPressed) and: [hoveredTile notNil]) 
		ifTrue: [aLayer 
			ifNotNil: [
				tileIdx := self tileIdxFromPosition: anEvent position.
				self tileMatrixStack layer: aLayer at: tileIdx y at: tileIdx x put: nil.
				hoveredTile abandon].
			self model savedSinceModified: false.].
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:42'
}
GMTEEditorTileMap >> updateTileSpriteFromModel: aTile [

	self model selectedTile
		ifNotNil:
			[aTile applyTileSprite: (self model selectedTile)]
]

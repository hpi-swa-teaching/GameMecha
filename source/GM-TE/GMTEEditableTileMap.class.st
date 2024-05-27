Class {
	#name : #GMTEEditableTileMap,
	#superclass : #GMTETileMap,
	#instVars : [
		'tileSelectionSet',
		'model'
	],
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/22/2024 16:41'
}
GMTEEditableTileMap class >> tileWidth: aWidth tileHeight: aHeight padding: aPadding sizeRatio: aRatio model: aModel [
	
	^ self new
		setDimensionsWidth: aWidth height: aHeight padding: aPadding;
		tileSizeRatio: aRatio;
		model: aModel.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 5/22/2024 18:32'
}
GMTEEditableTileMap >> handlesMouseDown: anEvent [
	"TODO: make this useful."
	^ true.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Alex M 5/22/2024 19:47'
}
GMTEEditableTileMap >> handlesMouseMove: anEvent [
	"TODO: make this useful."
	^ true.
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TW 5/22/2024 15:48'
}
GMTEEditableTileMap >> initialize [

	super initialize.
	self tileSelectionSet: GMTETileSelectionSet new.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 16:45'
}
GMTEEditableTileMap >> model [

	^model
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 16:40'
}
GMTEEditableTileMap >> model: anObject [

	model := anObject.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 23:53'
}
GMTEEditableTileMap >> mouseDown: anEvent [
	"TODO: make this useful."
	
	| clickedTile tileIdx tmpActiveLayer|
	
	tmpActiveLayer := self model LAYER_TEST.
	
	clickedTile := self tileFromPosition: anEvent position layer: 1.
	(anEvent redButtonPressed) ifTrue: [clickedTile ifNotNil: [self updateTileSprite: clickedTile]].
	(anEvent yellowButtonPressed) ifTrue: [clickedTile ifNotNil: [clickedTile reset]].
	
	(anEvent redButtonPressed) 
		ifTrue: [clickedTile 
			ifNil: [
				tileIdx := self tileIdxFromPosition: anEvent position.
				tileIdx ifNil: [^nil].
				clickedTile := self generateTileAtlayer: tmpActiveLayer x: tileIdx x y: tileIdx y stack: self tileMatrixStack.]. 
			self updateTileSprite: clickedTile].
	(anEvent yellowButtonPressed) 
		ifTrue: [clickedTile 
			ifNotNil: [
				tileIdx := self tileIdxFromPosition: anEvent position.
				self tileMatrixStack layer: 1 at: tileIdx y at: tileIdx x put: nil.
				clickedTile abandon]].
	
	^ true.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 23:57'
}
GMTEEditableTileMap >> mouseMove: anEvent [

	| hoveredTile hoveredTileVisual tileIdx tmpActiveLayer |

	"TODO currently hard coded"
	tmpActiveLayer := self model LAYER_TEST.
	
	hoveredTile := self tileFromPosition: anEvent position layer: tmpActiveLayer.
	hoveredTileVisual := self tileVisualFromPosition: anEvent position.
	
	self tileSelectionSet clearAllHighlightings.
	
	hoveredTileVisual 
		ifNotNil: [self tileSelectionSet highlightTile: hoveredTileVisual].
	
	"TODO why another ifNil check here?"
	(anEvent redButtonPressed) 
		ifTrue: [hoveredTile 
			ifNil: [
				tileIdx := self tileIdxFromPosition: anEvent position.
				tileIdx ifNil: [^nil].
				hoveredTile := self generateTileAtlayer: tmpActiveLayer x: tileIdx x y: tileIdx y stack: self tileMatrixStack.]. 
			self updateTileSprite: hoveredTile].
	(anEvent yellowButtonPressed) 
		ifTrue: [hoveredTile 
			ifNotNil: [
				tileIdx := self tileIdxFromPosition: anEvent position.
				self tileMatrixStack layer: 1 at: tileIdx y at: tileIdx x put: nil.
				hoveredTile abandon]].
	
	"This solves the bug but not the root of the issue. TODO further investigation."
	"self updateTiles."
	"hoveredTileVisual
		extent: self tileSizeWidth@self tileSizeHeight;
		borderColor: Color white;
		color: Color veryLightGray;
		borderWidth: 2"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/23/2024 00:08'
}
GMTEEditableTileMap >> resetAll [
	
	self gridTileMatrix do: [:aTile | aTile reset]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 15:49'
}
GMTEEditableTileMap >> tileSelectionSet [

	^ tileSelectionSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 15:49'
}
GMTEEditableTileMap >> tileSelectionSet: anObject [

	tileSelectionSet := anObject.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/23/2024 10:14'
}
GMTEEditableTileMap >> updateTileSprite: aTile [

	self model selectedTile ifNotNil: [aTile updateSprite: (self model selectedTile image)].
]

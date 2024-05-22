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
	#'squeak_changestamp' : 'TW 5/22/2024 15:48'
}
GMTEEditableTileMap >> handlesMouseMove: anEvent [

	^ true
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 5/22/2024 18:32'
}
GMTEEditableTileMap >> handlesMouseStillDown: anEvent [

	^true

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
	#'squeak_changestamp' : 'TW 5/22/2024 18:32'
}
GMTEEditableTileMap >> mouseDown: anEvent [
	"TODO: make this useful."
	
	| clickedTile |
	
	clickedTile := self tileFromPosition: anEvent position.
	clickedTile ifNotNil: [self updateTileSprite: clickedTile].
	^ true.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 5/22/2024 15:47'
}
GMTEEditableTileMap >> mouseMove: anEvent [

	| hoveredTile |
	
	hoveredTile := self tileFromPosition: anEvent position.
	hoveredTile ifNil: [
		self tileSelectionSet clearAllHighlightings. 
		^nil].
	
	self tileSelectionSet clearAllHighlightings.
	self tileSelectionSet highlightTile: hoveredTile.

]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 5/22/2024 18:44'
}
GMTEEditableTileMap >> mouseStillDown: anEvent [
	
	| clickedTile |
	
	clickedTile := self tileFromPosition: anEvent position.
	clickedTile ifNotNil: [self updateTileSprite: clickedTile].
	^true

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
	#'squeak_changestamp' : 'TW 5/22/2024 17:18'
}
GMTEEditableTileMap >> updateTileSprite: aTile [

	self model selectedTile ifNotNil: [aTile updateSprite: (self model selectedTile image)].
]

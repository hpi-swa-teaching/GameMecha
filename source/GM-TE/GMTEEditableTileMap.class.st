Class {
	#name : #GMTEEditableTileMap,
	#superclass : #GMTETileMap,
	#instVars : [
		'tileSelectionSet'
	],
	#category : #'GM-TE-Core'
}

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TW 5/22/2024 15:48'
}
GMTEEditableTileMap >> handlesMouseMove: anEvent [

	^ true
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

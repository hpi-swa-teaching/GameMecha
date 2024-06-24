Class {
	#name : #GMTETileSelectionSet,
	#superclass : #Set,
	#instVars : [
		'highlightImage'
	],
	#category : #'GM-TE-TileMap'
}

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:46'
}
GMTETileSelectionSet >> applyHighlightingVisuals: aTile [
	
	aTile applyDecoMorphHighlighting: self highlightImage
	
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'jj 6/24/2024 11:23'
}
GMTETileSelectionSet >> clearAllHighlightings [
	
	self do: [ :tile |
		self removeHighlightingVisuals: tile].
	self removeAll
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:31'
}
GMTETileSelectionSet >> highlightImage [

	^ highlightImage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:28'
}
GMTETileSelectionSet >> highlightImage: anObject [

	highlightImage := anObject
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:46'
}
GMTETileSelectionSet >> highlightTile: aTile [
	"comment stating purpose of message"

	self
		add: aTile;
		applyHighlightingVisuals: aTile
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TW 6/22/2024 01:28'
}
GMTETileSelectionSet >> initialize: n [
	
	super initialize: n
	
	
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:47'
}
GMTETileSelectionSet >> removeHighlightingVisuals: aTile [
	
	aTile removeDecoMorphHighlighting
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:47'
}
GMTETileSelectionSet >> unhighlightTile: aTile [

	self
		remove: aTile;
		removeHighlightingVisuals: aTile
]

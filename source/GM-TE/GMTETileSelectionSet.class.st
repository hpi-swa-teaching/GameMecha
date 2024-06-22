Class {
	#name : #GMTETileSelectionSet,
	#superclass : #Set,
	#instVars : [
		'highlightImage'
	],
	#category : #'GM-TE-Core'
}

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:14'
}
GMTETileSelectionSet >> applyHighlightingVisuals: aTile [
	"comment stating purpose of message"

	"aTile morphicLayerNumber: 99."
	"aTile borderWidth: 2."
	"aTile borderColor: Color red."
	
	aTile applyDecoMorphHighlighting: self highlightImage
	
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'TW 6/22/2024 01:28'
}
GMTETileSelectionSet >> clearAllHighlightings [
	
	self do: [ :tile | self removeHighlightingVisuals: tile].
	self removeAll
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 15:59'
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:28'
}
GMTETileSelectionSet >> highlightTile: aTile [
	"comment stating purpose of message"

	self add: aTile.
	self applyHighlightingVisuals: aTile
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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:14'
}
GMTETileSelectionSet >> removeHighlightingVisuals: aTile [
	"comment stating purpose of message"
	

	"TODO: Use constants here"
	"aTile morphicLayerNumber: 100."
	"aTile borderWidth: 2."
	"aTile borderColor: Color white."
	
	aTile removeDecoMorphHighlighting
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'TW 6/22/2024 01:28'
}
GMTETileSelectionSet >> unhighlightTile: aTile [
	"comment stating purpose of message"

	self remove: aTile.
	self removeHighlightingVisuals: aTile
]

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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:51'
}
GMTETileSelectionSet >> applyHighlightingVisuals: aTile [
	"Apply everything that is considered as 'highlighting' to the tile selection"
	
	aTile applyDecoMorphHighlighting: self highlightImage
	
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:51'
}
GMTETileSelectionSet >> clearAllHighlightings [
	"Clear tile selection and remove applied highlightings if any"
	
	self do: [ :tile | self removeHighlightingVisuals: tile].
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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:52'
}
GMTETileSelectionSet >> highlightTile: aTile [
	"Add aTile to selection and apply highlights"

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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:51'
}
GMTETileSelectionSet >> removeHighlightingVisuals: aTile [
	"Remove everything that is considered as 'highlighting' to the tile selection"
	
	aTile removeDecoMorphHighlighting
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:52'
}
GMTETileSelectionSet >> unhighlightTile: aTile [
	"Remove aTile to selection and remove highlights"

	self
		remove: aTile;
		removeHighlightingVisuals: aTile
]

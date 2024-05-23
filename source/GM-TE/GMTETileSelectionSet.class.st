Class {
	#name : #GMTETileSelectionSet,
	#superclass : #Set,
	#instVars : [
		'decoMorphMapping',
		'highlightImage'
	],
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/23/2024 13:39'
}
GMTETileSelectionSet >> applyHighlightingVisuals: aTile [
	"comment stating purpose of message"

	| newDecoMorph |
	"aTile morphicLayerNumber: 99."
	"aTile borderWidth: 2."
	"aTile borderColor: Color red."
	
	self highlightImage 
		ifNotNil: [
			newDecoMorph := ImageMorph new
			bounds: aTile bounds.
			newDecoMorph image: (self highlightImage scaledToSize: aTile extent)]
		ifNil: [
			newDecoMorph := Morph new
			bounds: aTile bounds.
			newDecoMorph color: (Color black alpha: 0.2)].
	aTile addMorph: newDecoMorph.
	self decoMorphMapping at: aTile put: newDecoMorph
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 21:06'
}
GMTETileSelectionSet >> clearAllHighlightings [
	
	self do: [ :tile | self removeHighlightingVisuals: tile].
	self removeAll.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 21:26'
}
GMTETileSelectionSet >> decoMorphMapping [

	^ decoMorphMapping
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 21:26'
}
GMTETileSelectionSet >> decoMorphMapping: anObject [

	decoMorphMapping := anObject.
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
	#'squeak_changestamp' : 'TW 5/22/2024 15:59'
}
GMTETileSelectionSet >> highlightImage: anObject [

	highlightImage := anObject.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 21:05'
}
GMTETileSelectionSet >> highlightTile: aTile [
	"comment stating purpose of message"

	self add: aTile.
	self applyHighlightingVisuals: aTile.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 21:50'
}
GMTETileSelectionSet >> initialize: n [
	
	super initialize: n.
	self decoMorphMapping: Dictionary new.
	
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 21:52'
}
GMTETileSelectionSet >> removeHighlightingVisuals: aTile [
	"comment stating purpose of message"
	
	| decoMorph |

	"TODO: Use constants here"
	"aTile morphicLayerNumber: 100."
	"aTile borderWidth: 2."
	"aTile borderColor: Color white."
	
	decoMorph := self decoMorphMapping at: aTile.
	self decoMorphMapping removeKey: aTile.
	
	aTile removeMorph: decoMorph	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 21:06'
}
GMTETileSelectionSet >> unhighlightTile: aTile [
	"comment stating purpose of message"

	self remove: aTile.
	self removeHighlightingVisuals: aTile.
]

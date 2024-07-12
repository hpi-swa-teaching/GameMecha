Class {
	#name : #GMTEView,
	#superclass : #Rectangle,
	#category : #'GM-TE-TileMap'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 16:06'
}
GMTEView >> canChangeSizeBy: aFloat [
	
	| newExtent |
	newExtent := (self extent + (aFloat@aFloat)).

	((newExtent x <= 0.1) or: [newExtent y <= 0.1]) ifTrue: [^ false].
	((newExtent x > 1) or: [newExtent y > 1]) ifTrue: [^ false].
	^ true

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 16:01'
}
GMTEView >> changeSizeBy: aFloat [

	| newExtent |
	newExtent := (self extent + (aFloat@aFloat)).

	self flag: 'magic number'.
	(self canChangeSizeBy: aFloat) ifFalse: [^ nil].
	(self isOverlappingOrigin: self origin withExtent: newExtent) ifTrue: [^ nil].

	self extent: newExtent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 20:20'
}
GMTEView >> extent: anExtent [

	self setOrigin: self origin corner: (self origin + anExtent)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 18:15'
}
GMTEView >> initialize [
	
	"Note: Viewport origin & extent interpreted as fraction of reference view (e.g. Morph)"

	super initialize.
	self reset
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/11/2024 22:43'
}
GMTEView >> isOverlappingOrigin: anOrigin withExtent: anExtent [

	| corner |
	corner := anOrigin + anExtent.
	
	self flag: 'tmp for testing'.
	^ false.
	
	"^ (((corner x > 1) or: [corner y > 1]) or: [anOrigin x < 0]) or: [anOrigin y < 0]"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 16:41'
}
GMTEView >> moveBy: aPoint [
	"Set origin but also respect view not overlapping reference view"

	| newOrigin |
	newOrigin := self origin + aPoint.

	(self isOverlappingOrigin: newOrigin withExtent: self extent) ifTrue: [^ nil].
	
	self origin: newOrigin
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 18:20'
}
GMTEView >> moveTo: anOrigin [
	"Set origin but also respect view not overlapping reference view"

	(self isOverlappingOrigin: anOrigin withExtent: self extent) ifTrue: [^ nil].
	
	self origin: anOrigin
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/11/2024 20:35'
}
GMTEView >> origin: aPoint [

	self setOrigin: aPoint corner: (aPoint + (self corner - self origin))
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 18:33'
}
GMTEView >> reset [

	self setOrigin: 0 @ 0 corner: 1 @ 1.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 22:53'
}
GMTEView >> size: aFraction [

	self extent: (aFraction @ aFraction)
]

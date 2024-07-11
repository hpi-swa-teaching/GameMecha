Class {
	#name : #GMTEView,
	#superclass : #Rectangle,
	#category : #'GM-TE-TileMap'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 18:17'
}
GMTEView >> enlargeBy: aFloat [

	| newExtent |
	newExtent := (self extent + (aFloat@aFloat)).

	self flag: 'magic number'.
	((newExtent x > 1) or: [newExtent y > 1]) ifTrue: [^ nil].
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
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 18:05'
}
GMTEView >> isOverlappingOrigin: anOrigin withExtent: anExtent [

	| corner |
	corner := anOrigin + anExtent.
	^ (corner x > 1) or: [corner y > 1]
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
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 18:33'
}
GMTEView >> origin: aPoint [

	self setOrigin: aPoint corner: (aPoint + self corner)
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
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 18:16'
}
GMTEView >> shrinkBy: aFloat [

	| newExtent |
	newExtent := (self extent - (aFloat@aFloat)).

	self flag: 'magic number'.
	((newExtent x <= 0.1) or: [newExtent y <= 0.1]) ifTrue: [^ nil].

	self extent: newExtent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 22:53'
}
GMTEView >> size: aFraction [

	self extent: (aFraction @ aFraction)
]

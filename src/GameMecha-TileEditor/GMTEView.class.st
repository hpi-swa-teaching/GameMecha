Class {
	#name : #GMTEView,
	#superclass : #Rectangle,
	#category : #'GameMecha-TileEditor'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 20:22'
}
GMTEView class >> minExtentValue [
	"Note: Heavily impacts performance, when used as Zoom Frame, since many big ImageMorph's seem to induce a major performance penality"
	
	^ 0.35
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 23:33'
}
GMTEView >> changeSizeBy: aFloat [
	
	| newExtent newOrigin |
	newExtent := self correctedExtent: (self extent + (aFloat@aFloat)).
	newOrigin := self correctedOrigin: self origin withExtent: newExtent.
	
	self origin: newOrigin.
	self extent: newExtent
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 23:33'
}
GMTEView >> correctedExtent: anExtent [
	
	| newX newY |
	newX := (anExtent x min: 1) max: GMTEView minExtentValue.
	newY := (anExtent y min: 1) max: GMTEView minExtentValue.
	
	^ newX @ newY.
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 20:13'
}
GMTEView >> correctedOrigin: anOrigin withExtent: anExtent [

	| newX newY |
	"Assuming: (0, 0) <= anExtent <= (1, 1)"
	newX := anOrigin x.
	newY := anOrigin y.
	
	(newX < 0) ifTrue: [newX := 0].	
	(newX + anExtent x > 1) ifTrue: [newX := 1 - anExtent x].

	(newY < 0) ifTrue: [newY := 0].	
	(newY + anExtent y > 1) ifTrue: [newY := 1 - anExtent y].
	
	^ newX @ newY
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 20:20'
}
GMTEView >> extent: anExtent [

	self setOrigin: self origin corner: (self origin + anExtent)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 23:43'
}
GMTEView >> initialize [
	"Note: Viewport origin & extent interpreted as fraction of reference view (e.g. Morph)"

	super initialize.
	self reset
	

]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 20:10'
}
GMTEView >> moveBy: aPoint [
	"Move origin but also respect view not overlapping reference view"

	self origin: (self correctedOrigin: (self origin + aPoint) withExtent: self extent)
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 19:44'
}
GMTEView >> moveTo: anOrigin [
	"Set origin but also respect view not overlapping reference view"

	self origin: (self correctedOrigin: anOrigin withExtent: self extent)

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/11/2024 20:35'
}
GMTEView >> origin: aPoint [

	self setOrigin: aPoint corner: (aPoint + (self corner - self origin))
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 18:33'
}
GMTEView >> reset [

	self setOrigin: 0 @ 0 corner: 1 @ 1.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 22:53'
}
GMTEView >> size: aFraction [

	self extent: (aFraction @ aFraction)
]

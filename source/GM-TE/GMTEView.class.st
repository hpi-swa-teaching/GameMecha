Class {
	#name : #GMTEView,
	#superclass : #Rectangle,
	#category : #'GM-TE-TileMap'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 20:20'
}
GMTEView >> extent: anExtent [

	self setOrigin: self origin corner: (self origin + anExtent)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 19:41'
}
GMTEView >> initialize [
	
	"Note: Viewport origin & extent interpreted as fraction of reference view (e.g. Morph)"

	super initialize.
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 20:14'
}
GMTEView >> origin: aPoint [

	self setOrigin: aPoint corner: self corner
]

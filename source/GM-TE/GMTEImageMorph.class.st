Class {
	#name : #GMTEImageMorph,
	#superclass : #ImageMorph,
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 14:55'
}
GMTEImageMorph >> extent: anExtent [
	"override ImageMorph extent functionality"
	
	self image: (self image scaledToSize: anExtent).
	super extent: anExtent
]

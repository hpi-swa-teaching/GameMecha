Class {
	#name : #GMTEImageMorph,
	#superclass : #ImageMorph,
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 19:58'
}
GMTEImageMorph >> extent: anExtent [
	"override ImageMorph extent functionality. ALWAYS KEEPS RATIO"
	
	"self image: (self image scaledToSize: anExtent)."

	self image: (self image scaledToSize: anExtent).

	super extent: anExtent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 19:43'
}
GMTEImageMorph >> setPlaceholderWithExtent: anExtent color: aColor [

	| placeholderForm |
	placeholderForm := Form extent: anExtent depth: 32.	
	placeholderForm fillColor: aColor.
	self image: placeholderForm.
]

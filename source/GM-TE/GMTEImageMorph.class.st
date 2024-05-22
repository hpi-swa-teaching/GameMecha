Class {
	#name : #GMTEImageMorph,
	#superclass : #ImageMorph,
	#instVars : [
		'fullResolutionSprite'
	],
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/22/2024 23:20'
}
GMTEImageMorph >> extent: anExtent [
	"override ImageMorph extent functionality. ALWAYS KEEPS RATIO"
	
	"self image: (self image scaledToSize: anExtent)."

	self image: (self fullResolutionSprite scaledToSize: anExtent).

	super extent: anExtent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 17:15'
}
GMTEImageMorph >> fullResolutionSprite [

	^ fullResolutionSprite
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/22/2024 17:15'
}
GMTEImageMorph >> fullResolutionSprite: anObject [

	fullResolutionSprite := anObject.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/22/2024 23:32'
}
GMTEImageMorph >> setPlaceholderColor: aColor [

	| placeholderForm |
	placeholderForm := Form extent: self extent depth: 32.	
	placeholderForm fillColor: aColor.
	self fullResolutionSprite: placeholderForm.
	self image: placeholderForm.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/22/2024 17:16'
}
GMTEImageMorph >> setPlaceholderWithExtent: anExtent color: aColor [

	| placeholderForm |
	placeholderForm := Form extent: anExtent depth: 32.	
	placeholderForm fillColor: aColor.
	self fullResolutionSprite: placeholderForm.
	self image: placeholderForm.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/22/2024 17:18'
}
GMTEImageMorph >> updateSprite: anImage [

	self fullResolutionSprite: anImage.
	self extent: self extent
]

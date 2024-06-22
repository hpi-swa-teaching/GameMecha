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
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:30'
}
GMTEImageMorph >> asBlendedWithImageMorph: anImageMorph [

	anImageMorph ifNil: [^self].
	
	^(ImageMorph new) 
		image: ((FormCanvas on: self image)
			image: (anImageMorph image)
			at: 0@0
			sourceRect: (anImageMorph image boundingBox)
			rule: Form blend)
			form;
		yourself
			
			
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:28'
}
GMTEImageMorph >> extent: anExtent [
	"override ImageMorph extent functionality. ALWAYS KEEPS RATIO"

	super extent: anExtent.
	self image: (self fullResolutionSprite scaledToSize: anExtent)
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:29'
}
GMTEImageMorph >> free [

	self owner ifNotNil: [self owner removeMorph: self].
	self abandon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:30'
}
GMTEImageMorph >> fullResolutionSprite [

	^fullResolutionSprite
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:16'
}
GMTEImageMorph >> fullResolutionSprite: anObject [

	fullResolutionSprite := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 6/22/2024 01:16'
}
GMTEImageMorph >> setPlaceholderWithColor: aColor [

	| placeholderForm |
	placeholderForm := Form extent: self extent depth: 32.	
	placeholderForm fillColor: aColor.
	self fullResolutionSprite: placeholderForm.
	self image: placeholderForm
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 6/22/2024 01:16'
}
GMTEImageMorph >> setPlaceholderWithExtent: anExtent color: aColor [

	| placeholderForm |
	placeholderForm := Form extent: anExtent depth: 32.	
	placeholderForm fillColor: aColor.
	self fullResolutionSprite: placeholderForm.
	self image: placeholderForm
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TW 5/22/2024 17:18'
}
GMTEImageMorph >> updateSprite: anImage [

	self fullResolutionSprite: anImage.
	self extent: self extent
]

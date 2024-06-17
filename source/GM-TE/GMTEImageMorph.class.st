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
	#'squeak_changestamp' : 'Alex M 6/17/2024 18:45'
}
GMTEImageMorph >> asBlendedWithImageMorph: anImageMorph [
	anImageMorph
		ifNil: [^ self].

	^ (ImageMorph new) 
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
	#'squeak_changestamp' : 'Alex M 5/23/2024 09:51'
}
GMTEImageMorph >> extent: anExtent [
	"override ImageMorph extent functionality. ALWAYS KEEPS RATIO"
	
	"self image: (self image scaledToSize: anExtent)."

	super extent: anExtent.
	self image: (self fullResolutionSprite scaledToSize: anExtent).
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/8/2024 22:01'
}
GMTEImageMorph >> free [

	(self owner) ifNotNil: [
		self owner removeMorph: self].
	self abandon
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

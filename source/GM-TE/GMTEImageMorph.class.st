Class {
	#name : #GMTEImageMorph,
	#superclass : #ImageMorph,
	#instVars : [
		'fullResolutionSprite'
	],
	#category : #'GM-TE-Core'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/23/2024 17:06'
}
GMTEImageMorph class >> placeholderDepth [
	"TODO: comment"
	
	^ 32
]

{
	#category : #copying,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:01'
}
GMTEImageMorph >> asBlendedWithImageMorph: anImageMorph [
	"Answer the sender with a new image morph that is a blend from self and anImageMorph"

	anImageMorph ifNil: [^ self].
	
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
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:28'
}
GMTEImageMorph >> extent: anExtent [
	"override ImageMorph extent functionality. ALWAYS KEEPS RATIO"

	super extent: anExtent.
	self image: (self fullResolutionSprite scaledToSize: anExtent)
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:02'
}
GMTEImageMorph >> free [
	"Fully delete morph"

	self owner ifNotNil: [self owner removeMorph: self].
	self abandon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:10'
}
GMTEImageMorph >> fullResolutionSprite [

	^ fullResolutionSprite
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:16'
}
GMTEImageMorph >> fullResolutionSprite: anObject [

	fullResolutionSprite := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:02'
}
GMTEImageMorph >> setPlaceholderWithColor: aColor [
	"Set a placeholder form with aColor"

	| placeholderForm |
	placeholderForm := Form extent: self extent depth: GMTEImageMorph placeholderDepth.	
	placeholderForm fillColor: aColor.
	self fullResolutionSprite: placeholderForm.
	self image: placeholderForm
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:03'
}
GMTEImageMorph >> setPlaceholderWithExtent: anExtent color: aColor [
	"Set a placeholder form with anExtent and aColor"

	| placeholderForm |
	placeholderForm := Form extent: anExtent depth: GMTEImageMorph placeholderDepth.	
	placeholderForm fillColor: aColor.
	self fullResolutionSprite: placeholderForm.
	self image: placeholderForm
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:55'
}
GMTEImageMorph >> updateSprite: anImage [
	"Update sprite by also carrying the fullResolutionSprite"

	self 
		fullResolutionSprite: anImage;
		extent: self extent
]

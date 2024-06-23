Class {
	#name : #GMTETileVisual,
	#superclass : #GMTETile,
	#instVars : [
		'decorationMorph'
	],
	#category : #'GM-TE-Core'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/23/2024 16:33'
}
GMTETileVisual class >> decoMorphAlphaValue [
	"the alpha value for the default decoMorph"
	
	^ 0.2
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'TW 6/22/2024 01:16'
}
GMTETileVisual >> applyBorderHighlighting [
	
	self 
		borderColor: Color white;
		borderWidth: 1
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'jj 6/23/2024 16:32'
}
GMTETileVisual >> applyDecoMorphHighlighting: aForm [
	
	| newDecoMorph |
	aForm 
		ifNotNil: [
			newDecoMorph := ImageMorph new
				bounds: self bounds.
			newDecoMorph image: (aForm scaledToSize: self extent)]
		ifNil: [
			newDecoMorph := Morph new
			bounds: self bounds.
			newDecoMorph color: (Color black alpha: GMTETileVisual decoMorphAlphaValue)].
	self addMorph: newDecoMorph.
	self decorationMorph: newDecoMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:26'
}
GMTETileVisual >> decorationMorph [

	^ decorationMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:16'
}
GMTETileVisual >> decorationMorph: anObject [

	decorationMorph := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/18/2024 10:14'
}
GMTETileVisual >> initialize [

	super initialize.
	self applyBorderHighlighting
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'TW 6/22/2024 01:16'
}
GMTETileVisual >> removeBorderHighlighting [
	
	self 
		borderColor: Color transparent;
		borderWidth: 0
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:25'
}
GMTETileVisual >> removeDecoMorphHighlighting [
	
	self removeMorph: self decorationMorph
]

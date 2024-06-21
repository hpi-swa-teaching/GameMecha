Class {
	#name : #GMTETileVisual,
	#superclass : #GMTETile,
	#instVars : [
		'decorationMorph'
	],
	#category : #'GM-TE-Core'
}

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/8/2024 22:36'
}
GMTETileVisual >> applyBorderHighlighting [
	
	self 
		borderColor: Color white;
		borderWidth: 1.
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:25'
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
			newDecoMorph color: (Color black alpha: 0.2)].
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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:26'
}
GMTETileVisual >> decorationMorph: anObject [

	decorationMorph := anObject.
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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:25'
}
GMTETileVisual >> removeBorderHighlighting [
	
	self 
		borderColor: Color transparent;
		borderWidth: 0.
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:25'
}
GMTETileVisual >> removeDecoMorphHighlighting [
	
	self removeMorph: self decorationMorph
]

Class {
	#name : #GMTETileHighlighting,
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
GMTETileHighlighting >> applyBorderHighlighting [
	
	self 
		borderColor: Color white;
		borderWidth: 1.
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:25'
}
GMTETileHighlighting >> applyDecoMorphHighlighting: aForm [
	
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
GMTETileHighlighting >> decorationMorph [

	^ decorationMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:26'
}
GMTETileHighlighting >> decorationMorph: anObject [

	decorationMorph := anObject.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/18/2024 10:14'
}
GMTETileHighlighting >> initialize [

	super initialize.
	self applyBorderHighlighting
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:25'
}
GMTETileHighlighting >> removeBorderHighlighting [
	
	self 
		borderColor: Color transparent;
		borderWidth: 0.
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:25'
}
GMTETileHighlighting >> removeDecoMorphHighlighting [
	
	self removeMorph: self decorationMorph
]

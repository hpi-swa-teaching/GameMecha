Class {
	#name : #GMTETileHighlighting,
	#superclass : #GMTETile,
	#instVars : [
		'decorationMorph'
	],
	#category : #'GameMecha-TileEditor'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 23:44'
}
GMTETileHighlighting class >> decoMorphAlphaValue [
	"The alpha value for the default decoMorph"
	
	^ 0.2
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:04'
}
GMTETileHighlighting >> applyBorderHighlighting [
	
	self 
		borderColor: Color white;
		borderWidth: 1
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 20:55'
}
GMTETileHighlighting >> applyDecoMorphHighlighting: aForm [
	"Set a form as a temporary decoration inside the tile"	

	| newDecoMorph |
	aForm 
		ifNotNil: [
			newDecoMorph := (ImageMorph new)
				bounds: self bounds;
				image: (aForm scaledToSize: self extent);
				yourself]
		ifNil: [
			newDecoMorph := Morph new
				bounds: self bounds;
				color: (Color black alpha: GMTETileHighlighting decoMorphAlphaValue);
				yourself].

	self 
		addMorph: newDecoMorph;
		decorationMorph: newDecoMorph
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:16'
}
GMTETileHighlighting >> decorationMorph: anObject [

	decorationMorph := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:16'
}
GMTETileHighlighting >> removeBorderHighlighting [
	
	self 
		borderColor: Color transparent;
		borderWidth: 0
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:25'
}
GMTETileHighlighting >> removeDecoMorphHighlighting [
	
	self removeMorph: self decorationMorph
]

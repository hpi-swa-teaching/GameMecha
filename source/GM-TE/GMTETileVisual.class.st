Class {
	#name : #GMTETileVisual,
	#superclass : #GMTETile,
	#instVars : [
		'decorationMorph'
	],
	#category : #'GM-TE-TileMap'
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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:04'
}
GMTETileVisual >> applyBorderHighlighting [
	
	self 
		borderColor: Color white;
		borderWidth: 1
]

{
	#category : #highlighting,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:55'
}
GMTETileVisual >> applyDecoMorphHighlighting: aForm [
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
				color: (Color black alpha: GMTETileVisual decoMorphAlphaValue);
				yourself].
	self 
		addMorph: newDecoMorph;
		decorationMorph: newDecoMorph
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

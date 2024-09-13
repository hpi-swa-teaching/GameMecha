Class {
	#name : #GMTETile,
	#superclass : #GMTEImageMorph,
	#category : #'GameMecha-TileEditor'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 23:44'
}
GMTETile class >> checkerBoardColors [

	^ {(0@0) -> Color lightGray.
		(1@1) -> Color lightGray.
		(0@1) -> Color gray.
		(1@0) -> Color gray
	} asDictionary
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 23:50'
}
GMTETile class >> checkerBoardTile [
	"Returns a tile with a checkboard pattern"
	
	| checkerboardPatternForm |
	
	checkerboardPatternForm := Form extent: 2 @ 2 depth: 32.
	self checkerBoardColors keysDo: [:offset | 
	checkerboardPatternForm colorAt: offset put: (self checkerBoardColors at: offset)].
	
	^ self fromSprite: checkerboardPatternForm
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'Alex M 7/1/2024 16:21'
}
GMTETile class >> fromSprite: aSprite [
	
	^ (self new)
		updateSprite: aSprite;
		yourself
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/22/2024 16:11'
}
GMTETile class >> placeHolderColor [
		
	^ Color transparent
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 23:51'
}
GMTETile class >> position: aPoint extent: anExtent [

	^ (self new)
		setPlaceholderWithExtent: anExtent color: self placeHolderColor;
		position: aPoint
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 20:36'
}
GMTETile >> copySpriteFromTile: aTile [

	self updateSprite: aTile fullResolutionSprite
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/12/2024 20:39'
}
GMTETile >> setToPlaceholder [
	"Debugging Tool: Set form to a place holder color"

	self setPlaceholderWithColor: GMTETile placeHolderColor
]

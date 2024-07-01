Class {
	#name : #GMTETile,
	#superclass : #GMTEImageMorph,
	#category : #'GM-TE-TileMap'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 7/1/2024 16:21'
}
GMTETile class >> fromSprite: aSprite [
	
	^ (self new)
		updateSprite: aSprite;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jj 6/22/2024 16:11'
}
GMTETile class >> placeHolderColor [
		
	^ Color transparent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jj 6/22/2024 16:11'
}
GMTETile class >> position: aPoint extent: anExtent [
	"comment stating purpose of message"

	^ (self new)
		setPlaceholderWithExtent: anExtent color: self placeHolderColor;
		position: aPoint
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:03'
}
GMTETile >> applyTileSprite: aTile [
	"Set new sprite to sprite of aTile"

	self updateSprite: aTile fullResolutionSprite
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:04'
}
GMTETile >> setToPlaceholder [
	"Set form to a place holder color"

	self setPlaceholderWithColor: GMTETile placeHolderColor
]

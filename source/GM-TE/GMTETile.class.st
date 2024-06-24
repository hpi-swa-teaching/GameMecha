Class {
	#name : #GMTETile,
	#superclass : #GMTEImageMorph,
	#category : #'GM-TE-TileMap'
}

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
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:34'
}
GMTETile >> applyTileSprite: aTile [

	self updateSprite: aTile fullResolutionSprite
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/18/2024 09:50'
}
GMTETile >> setToPlaceholder [

	self setPlaceholderWithColor: GMTETile placeHolderColor
]

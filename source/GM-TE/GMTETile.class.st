Class {
	#name : #GMTETile,
	#superclass : #GMTEImageMorph,
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 23:21'
}
GMTETile class >> placeHolderColor [
		
	^Color transparent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/22/2024 23:32'
}
GMTETile class >> position: aPoint extent: anExtent [
	"comment stating purpose of message"

	^ self new
		setPlaceholderWithExtent: anExtent color: self placeHolderColor;
		position: aPoint
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/22/2024 23:33'
}
GMTETile >> reset [

	self setPlaceholderColor: GMTETile placeHolderColor
]

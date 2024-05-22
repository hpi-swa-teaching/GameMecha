Class {
	#name : #GMTETile,
	#superclass : #GMTEImageMorph,
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 20:08'
}
GMTETile class >> position: aPoint extent: anExtent [
	"comment stating purpose of message"

	^ self new
		setPlaceholderWithExtent: anExtent color: Color veryLightGray;
		position: aPoint
]

Class {
	#name : #GMTETile,
	#superclass : #GMTEImageMorph,
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/20/2024 21:44'
}
GMTETile class >> position: aPoint width: aWidth height: aHeight [
	"comment stating purpose of message"

	^ self new
		extent: aWidth @ aHeight;
		position: aPoint
]

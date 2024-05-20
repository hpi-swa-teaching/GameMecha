Class {
	#name : #GMTETile,
	#superclass : #GMTEImageMorph,
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 16:45'
}
GMTETile class >> x: x y: y width: aWidth height: aHeight [
	"comment stating purpose of message"

	^ self new
		extent: aWidth @ aHeight;
		position: x @ y
]

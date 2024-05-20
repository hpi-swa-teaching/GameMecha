Class {
	#name : #GMTETilePlaceholder,
	#superclass : #Morph,
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/20/2024 20:34'
}
GMTETilePlaceholder class >> x: x y: y width: aWidth height: aHeight [
	"comment stating purpose of message"

	^ self new
		extent: aWidth @ aHeight;
		position: x @ y
]

Class {
	#name : #GMTETileMatrixLayer,
	#superclass : #GMTEStaticCoordinateMatrix,
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 21:40'
}
GMTETileMatrixLayer >> free [

	self contents do: [ :imageMorph | imageMorph abandon]
]

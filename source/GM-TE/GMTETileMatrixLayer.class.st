Class {
	#name : #GMTETileMatrixLayer,
	#superclass : #GMTEStaticCoordinateMatrix,
	#category : #'GM-TE-Core'
}

{
	#category : #enumerating,
	#'squeak_changestamp' : 'Valentin Teutschbein 6/7/2024 20:55'
}
GMTETileMatrixLayer >> doTiles: aBlock [

	self contents do: [ :tile | 
		tile ifNotNil: [aBlock value: tile]]
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Valentin Teutschbein 6/7/2024 20:50'
}
GMTETileMatrixLayer >> free [

	self doTiles: [ :imageMorph | imageMorph abandon]
]

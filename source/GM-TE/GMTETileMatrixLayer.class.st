Class {
	#name : #GMTETileMatrixLayer,
	#superclass : #GMTEStaticCoordinateMatrix,
	#category : #'GM-TE-Core'
}

{
	#category : #copying,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/8/2024 22:26'
}
GMTETileMatrixLayer >> asRescaledToWidth: aWidth height: aHeight [

	| newMatrix |
	newMatrix := self class rows: aHeight columns: aWidth.
	
	"Copy over tiles & handle tile removal"
	
	1 to: (aHeight min: self rowCount) do: [:row |
    		1 to: (aWidth min: self columnCount) do: [:col |
       		 newMatrix at: row at: col put: (self at: row at: col) veryDeepCopy]].

	^newMatrix
	 
]

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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/8/2024 22:23'
}
GMTETileMatrixLayer >> free [

	self doTiles: [ :tile | 
		tile free].
	
	self setNil
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/8/2024 22:23'
}
GMTETileMatrixLayer >> setNil [

	1 to: self rowCount do: [:row |
   		1 to: self columnCount do: [:col |
        		self at: row at: col put: nil]].
]

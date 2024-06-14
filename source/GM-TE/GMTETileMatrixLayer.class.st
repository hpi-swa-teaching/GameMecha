Class {
	#name : #GMTETileMatrixLayer,
	#superclass : #GMTEStaticCoordinateMatrix,
	#instVars : [
		'layerIdx'
	],
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/11/2024 19:11'
}
GMTETileMatrixLayer class >> width: aWidth height: aHeight layerIdx: anIdx [

	^(self rows: aHeight columns: aWidth)  
		layerIdx: anIdx; 
		yourself
]

{
	#category : #copying,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/12/2024 18:31'
}
GMTETileMatrixLayer >> aboveLayer: aLayer [
	
	"As a layerIdx corresponds to the morphicLayerNumber smaller is 'better'"
	^(self layerIdx < aLayer layerIdx)
]

{
	#category : #adding,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/11/2024 19:16'
}
GMTETileMatrixLayer >> addTile: aTile at: x at: y [

	aTile ifNotNil: [
		aTile morphicLayerNumber: self layerIdx].
	^self at: x at: y put: aTile
]

{
	#category : #copying,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/14/2024 19:01'
}
GMTETileMatrixLayer >> asRescaledToWidth: aWidth height: aHeight [

	| newLayer |
	newLayer := self class width: aWidth height: aHeight layerIdx: self layerIdx.
	
	"Copy over tiles & handle tile removal"
	
	1 to: (aHeight min: self rowCount) do: [:row |
    		1 to: (aWidth min: self columnCount) do: [:col |
       		 newLayer at: row at: col put: (self at: row at: col) veryDeepCopy]].

	^newLayer
	 
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/12/2024 18:30'
}
GMTETileMatrixLayer >> belowLayer: aLayer [

	^(self aboveLayer: aLayer) not
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
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/11/2024 19:09'
}
GMTETileMatrixLayer >> layerIdx [

	^ layerIdx
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/11/2024 19:09'
}
GMTETileMatrixLayer >> layerIdx: anObject [

	layerIdx := anObject.
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

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/11/2024 19:18'
}
GMTETileMatrixLayer >> updateLayerIdx: anIdx [

	self layerIdx: anIdx.
	self doTiles: [ :tile |
		tile morphicLayerNumber: self layerIdx]
]

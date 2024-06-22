Class {
	#name : #GMTETileMatrixLayer,
	#superclass : #GMTEStaticCoordinateMatrix,
	#instVars : [
		'layerIdx',
		'visible'
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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/18/2024 10:41'
}
GMTETileMatrixLayer >> addTile: aTile at: x at: y [

	aTile ifNotNil: [
		aTile morphicLayerNumber: self layerIdx.
		aTile visible: self visible].
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:26'
}
GMTETileMatrixLayer >> doTiles: aBlock [

	"Instance variable must be used here"
	(contents) ifNil: [^nil].
	
	self contents do: [:tile | tile ifNotNil: [aBlock value: tile]]
]

{
	#category : #removing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:26'
}
GMTETileMatrixLayer >> free [

	self doTiles: [:tile | tile free].
	
	self setNil
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/18/2024 10:25'
}
GMTETileMatrixLayer >> initialize [

	super initialize.
	
	self visible: true
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:25'
}
GMTETileMatrixLayer >> layerIdx: anObject [

	layerIdx := anObject
]

{
	#category : #removing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:26'
}
GMTETileMatrixLayer >> setNil [

	1 to: self rowCount do: [:row |
   		1 to: self columnCount do: [:col | self at: row at: col put: nil]]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TW 6/22/2024 01:27'
}
GMTETileMatrixLayer >> updateLayerIdx: anIdx [

	self layerIdx: anIdx.
	self doTiles: [:tile | tile morphicLayerNumber: self layerIdx]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/18/2024 10:17'
}
GMTETileMatrixLayer >> visible [

	^ visible
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:26'
}
GMTETileMatrixLayer >> visible: aBool [

	visible := aBool.	
		
	self doTiles: [:tile | tile visible: aBool]
]

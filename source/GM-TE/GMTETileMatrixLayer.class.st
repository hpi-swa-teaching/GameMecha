Class {
	#name : #GMTETileMatrixLayer,
	#superclass : #GMTEStaticCoordinateMatrix,
	#instVars : [
		'layerIndex',
		'visible',
		'displayName'
	],
	#category : #'GM-TE-TileMap'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 6/23/2024 23:36'
}
GMTETileMatrixLayer class >> width: aWidth height: aHeight layerIndex: anIndex [

	^ (self rows: aHeight columns: aWidth)  
		layerIndex: anIndex;
		yourself
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:23'
}
GMTETileMatrixLayer >> aboveLayer: aLayer [
	
	"As a layerIndex corresponds to the morphicLayerNumber smaller is 'better'"
	^ (self layerIndex < aLayer layerIndex)
]

{
	#category : #adding,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/5/2024 17:50'
}
GMTETileMatrixLayer >> addTile: aTile at: y at: x [

	(aTile isNil not and: [self inBounds: x@y]) ifTrue: [
		aTile morphicLayerNumber: self layerIndex.
		aTile visible: self visible].
	^ self at: y at: x put: aTile
	


]

{
	#category : #copying,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:39'
}
GMTETileMatrixLayer >> asRescaledToWidth: aWidth height: aHeight [
	"Return copy with size (aWidth, aHeight)"

	| newLayer |
	newLayer := self class width: aWidth height: aHeight layerIndex: self layerIndex.
	
	"Copy over tiles & handle tile removal"
	
	1 to: (aHeight min: self rowCount) do: [:row |
    		1 to: (aWidth min: self columnCount) do: [:col |
       		 newLayer at: row at: col put: (self at: row at: col) veryDeepCopy]].

	newLayer
		visible: self visible;
		displayName: self displayName.

	^ newLayer
	 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/9/2024 11:14'
}
GMTETileMatrixLayer >> at: row at: column [
	
	(self inBounds: column@row) ifFalse: [^ nil].
	^ super at: row at: column
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:39'
}
GMTETileMatrixLayer >> belowLayer: aLayer [
	"Check if self is logically beneath aLayer"

	^ (self aboveLayer: aLayer) not
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 19:47'
}
GMTETileMatrixLayer >> displayName [

	^ displayName
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 19:54'
}
GMTETileMatrixLayer >> displayName: anObject [

	displayName := anObject
]

{
	#category : #enumerating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:55'
}
GMTETileMatrixLayer >> doTiles: aBlock [
	"Convenience method to apply aBlock to every tile (if not nil)"

	"Instance variable must be used here"
	contents ifNil: [^ nil].
	
	self contents do: [:tile | tile ifNotNil: [aBlock value: tile]]
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:40'
}
GMTETileMatrixLayer >> free [
	"Correctly free tiles from layer"

	self doTiles: [:tile | tile free].
	
	self setNil
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/5/2024 17:52'
}
GMTETileMatrixLayer >> inBounds: aPos [

	(aPos x > self columnCount or: [aPos x < 1]) ifTrue: [^ false].
	(aPos y > self rowCount or: [aPos y < 1]) ifTrue: [^ false].
	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 21:09'
}
GMTETileMatrixLayer >> initialize [

	super initialize.
	self visible: true
	

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:24'
}
GMTETileMatrixLayer >> layerIndex [

	^ layerIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:25'
}
GMTETileMatrixLayer >> layerIndex: anObject [

	layerIndex := anObject
]

{
	#category : #removing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:25'
}
GMTETileMatrixLayer >> setNil [

	1 to: self rowCount do: [:row |
   		1 to: self columnCount do: [:col | self at: row at: col put: nil]]
]

{
	#category : #copying,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 18:28'
}
GMTETileMatrixLayer >> tileLossAfterRescaleToWidth: aWidth height: aHeight [

	| removedTiles tile |
	removedTiles := Set new.
	
	(aWidth + 1) to: self columnCount do: [:col |
			1 to: self rowCount do: [:row |
				tile := self at: row at: col.
				tile ifNotNil: [removedTiles add: tile]]].
	
	(aHeight + 1) to: self rowCount do: [:row |
			1 to: self columnCount do: [:col |
				tile := self at: row at: col.
				tile ifNotNil: [removedTiles add: tile]]].
	
	^ removedTiles
]

{
	#category : #copying,
	#'squeak_changestamp' : 'Alex M 7/12/2024 18:02'
}
GMTETileMatrixLayer >> tileLossAfterRescaleToWidth: aWidth height: aHeight layerId: aLayerId [

	| removedTiles tile layer |
	removedTiles := Dictionary new.
	layer := aLayerId.
			
	(aWidth + 1) to: self columnCount do: [:col |
			1 to: self rowCount do: [:row |
				tile := self at: row at: col.
				tile ifNotNil: [removedTiles at: {col. row. layer} put: tile fullResolutionSprite]]].
	
	(aHeight + 1) to: self rowCount do: [:row |
			1 to: self columnCount do: [:col |
				tile := self at: row at: col.
				tile ifNotNil: [removedTiles at: {col. row. layer} put: tile fullResolutionSprite]]].
	
	^ removedTiles
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:40'
}
GMTETileMatrixLayer >> updateLayerTo: anIndex [
	"Set a new layerIndex & update morphicLayerNumber accordingly"

	self layerIndex: anIndex.
	self doTiles: [:tile | tile morphicLayerNumber: self layerIndex]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:24'
}
GMTETileMatrixLayer >> visible [

	^ visible
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:25'
}
GMTETileMatrixLayer >> visible: aBool [

	visible := aBool.	
		
	self doTiles: [:tile | tile visible: aBool]
]

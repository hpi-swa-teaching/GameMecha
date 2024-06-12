Class {
	#name : #GMTETileMatrixStack,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'matrixLayers',
		'morphicLayerStartingOffset'
	],
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/12/2024 14:27'
}
GMTETileMatrixStack class >> fromWidth: aWidth height: aHeight [

	^self fromWidth: aWidth height: aHeight morphicLayerOffset: 100 "TODO: magic number"
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/12/2024 14:25'
}
GMTETileMatrixStack class >> fromWidth: aWidth height: aHeight morphicLayerOffset: anOffset [

	^GMTETileMatrixStack new
		width: aWidth;
		height: aHeight;
		morphicLayerStartingOffset: anOffset;
		pushLayer;
		 yourself
		
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/12/2024 18:49'
}
GMTETileMatrixStack >> blendLayer: anIdx1 with: anIdx2 [

	| topIdx bottomLayer topLayer bottomCell topCell newCellEntry |
	
	((self layer: anIdx1) belowLayer: (self layer: anIdx2))
		ifTrue: [
			bottomLayer := self layer: anIdx1.
			topLayer := self layer: anIdx2.
			topIdx := anIdx2]
		ifFalse: [
			bottomLayer := self layer: anIdx2.
			topLayer := self layer: anIdx1.
			topIdx := anIdx1].
		
	1 to: bottomLayer columnCount do: [ :x |
		1 to: bottomLayer rowCount do: [ :y |
			bottomCell := bottomLayer at: x at: y.
			topCell := topLayer at: x at: y.
			bottomCell 
				ifNil: [
					newCellEntry := topCell.
					bottomLayer addTile: newCellEntry at: x at: y]
				ifNotNil: [
					newCellEntry := bottomCell asBlendedWithImageMorph: topCell.
					bottomCell image: newCellEntry image]]].
	
	self removeLayerAt: topIdx
	
		
	
	
	
]

{
	#category : #eumerating,
	#'squeak_changestamp' : 'Valentin Teutschbein 6/7/2024 21:50'
}
GMTETileMatrixStack >> doLayers: aBlock [

	self matrixLayers do: [ :layer | aBlock value: layer]
]

{
	#category : #eumerating,
	#'squeak_changestamp' : 'Valentin Teutschbein 6/7/2024 21:50'
}
GMTETileMatrixStack >> doTiles: aBlock [

	self doLayers: [ :layer | layer doTiles: aBlock]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 21:16'
}
GMTETileMatrixStack >> height [

	^ height
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 21:16'
}
GMTETileMatrixStack >> height: anObject [

	height := anObject.
]

{
	#category : #initilization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/12/2024 14:25'
}
GMTETileMatrixStack >> initialize [

	super initialize.
	self matrixLayers: LinkedList new
	"TODO: no base layer created"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/12/2024 18:28'
}
GMTETileMatrixStack >> layer: aLayerIdx [
	
	^ self matrixLayers at: aLayerIdx
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 5/28/2024 11:15'
}
GMTETileMatrixStack >> layer: aLayerIdx at: x at: y [ 

	^ (self matrixLayers at: aLayerIdx) at: x at: y
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/12/2024 17:38'
}
GMTETileMatrixStack >> layer: aLayerIdx at: x at: y put: aTile [
	
	^ (self matrixLayers at: aLayerIdx) addTile: aTile at: x at: y
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 21:23'
}
GMTETileMatrixStack >> layerCount [

	^ self matrixLayers size
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 21:15'
}
GMTETileMatrixStack >> matrixLayers [

	^ matrixLayers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 21:15'
}
GMTETileMatrixStack >> matrixLayers: anObject [

	matrixLayers := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin 5/28/2024 13:16'
}
GMTETileMatrixStack >> morphicLayerStartingOffset [

	^ morphicLayerStartingOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin 5/28/2024 13:16'
}
GMTETileMatrixStack >> morphicLayerStartingOffset: anObject [

	morphicLayerStartingOffset := anObject.
]

{
	#category : #adding,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/11/2024 19:22'
}
GMTETileMatrixStack >> pushLayer [
	self matrixLayers addLast: (GMTETileMatrixLayer 
		width: self width 
		height: self height 
		layerIdx: (self morphicLayerStartingOffset - self layerCount - 2)) "TODO: outsource magic number"
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Valentin Teutschbein 6/7/2024 21:20'
}
GMTETileMatrixStack >> removeLayerAt: idx [ 

	| removedLayer |.
	self assert: idx ~= 1 description: 'Base layer cannot be removed!'.
	
	removedLayer := (self matrixLayers removeLink: (self matrixLayers linkAt: idx)) value.
	removedLayer free.
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/11/2024 18:48'
}
GMTETileMatrixStack >> rescaleToWidth: aWidth height: aHeight [
	"This will rescale layers be recreating them"

	| newLayers newLayer |
	self 
		width: aWidth;
		height: aHeight. 
	
	newLayers := LinkedList new.

	self doLayers: [ :layer | 
		newLayer := layer asRescaledToWidth: aWidth height: aHeight.
		newLayers addLast: newLayer.
		layer free].
		
	self matrixLayers: newLayers.
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/8/2024 21:31'
}
GMTETileMatrixStack >> reset [

	self layerCount to: 2 by: -1 do: [ :layer | self removeLayerAt: layer].
	(self layer: 1) free
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/11/2024 19:33'
}
GMTETileMatrixStack >> swapLayer: anIdx1 with: anIdx2 [

	| tmpMorhpicLayer layer1 layer2 |
	
	layer1 := self layer: anIdx1.
	layer2 := self layer: anIdx2.
	tmpMorhpicLayer := layer1 layerIdx.
	
	layer1 updateLayerIdx: layer2 layerIdx.
	layer2 updateLayerIdx: tmpMorhpicLayer.

	self matrixLayers swap: anIdx1 with: anIdx2.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 22:05'
}
GMTETileMatrixStack >> width [

	^ width
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 22:05'
}
GMTETileMatrixStack >> width: anObject [

	width := anObject.
]

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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 22:07'
}
GMTETileMatrixStack class >> fromWidth: aWidth height: aHeight [

	^GMTETileMatrixStack new
		width: aWidth;
		height: aHeight;
		pushLayer;
		 yourself
		
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Valentin 5/28/2024 13:17'
}
GMTETileMatrixStack >> initialize [

	super initialize.
	self matrixLayers: LinkedList new.
	self morphicLayerStartingOffset: 100.
	"TODO: no base layer created"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 21:34'
}
GMTETileMatrixStack >> layer: aLayerIdx [

	^ self matrixLayers at: aLayerIdx
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TW 5/28/2024 11:15'
}
GMTETileMatrixStack >> layer: aLayerIdx at: x at: y [ 

	^ (self matrixLayers at: aLayerIdx) at: x at: y
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Valentin 5/28/2024 13:17'
}
GMTETileMatrixStack >> layer: aLayerIdx at: x at: y put: aTile [
	
	"TODO this is temporary solution; set max layers; use constants"
	
	aTile ifNotNil: [aTile morphicLayerNumber: self morphicLayerStartingOffset - aLayerIdx].
	^ (self matrixLayers at: aLayerIdx) at: x at: y put: aTile
]

{
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 21:38'
}
GMTETileMatrixStack >> pushLayer [

	self matrixLayers addLast: (GMTETileMatrixLayer rows: self width columns: self height)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 21:46'
}
GMTETileMatrixStack >> removeLayerAt: idx [ 

	| removedLayer |.
	self assert: idx ~= 1 description: 'Base layer cannot be removed!'.
	
	removedLayer := self matrixLayers removeLink: (self matrixLayers linkAt: idx) value.
	removedLayer free.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 21:19'
}
GMTETileMatrixStack >> width [

	^ widht
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 21:19'
}
GMTETileMatrixStack >> width: anObject [

	widht := anObject.
]

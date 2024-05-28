Class {
	#name : #GMTETileMatrixStack,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'matrixLayers'
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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 22:08'
}
GMTETileMatrixStack >> initialize [

	super initialize.
	self matrixLayers: LinkedList new.
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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 23:48'
}
GMTETileMatrixStack >> layer: aLayerIdx at: x at: y put: aTile [
	
	"TODO this is temporary solution; set max layers; use constants"
	
	aTile ifNotNil: [aTile morphicLayerNumber: 100 - aLayerIdx].
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

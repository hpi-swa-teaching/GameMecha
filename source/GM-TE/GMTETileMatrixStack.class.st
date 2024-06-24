Class {
	#name : #GMTETileMatrixStack,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'matrixLayers',
		'morphicLayerStartingOffset',
		'visible'
	],
	#category : #'GM-TE-TileMap'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jj 6/23/2024 17:02'
}
GMTETileMatrixStack class >> fromWidth: aWidth height: aHeight [

	^ self fromWidth: aWidth height: aHeight morphicLayerOffset: GMTETileMatrixStack morphicLayerOffsetDefault 
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jj 6/22/2024 16:28'
}
GMTETileMatrixStack class >> fromWidth: aWidth height: aHeight morphicLayerOffset: anOffset [

	^ (GMTETileMatrixStack new)
		width: aWidth;
		height: aHeight;
		morphicLayerStartingOffset: anOffset;
		pushLayer;
		yourself
		
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/23/2024 16:53'
}
GMTETileMatrixStack class >> morphicLayerDistance [
	"TODO: comment"
		
	^ 2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/23/2024 16:55'
}
GMTETileMatrixStack class >> morphicLayerOffsetDefault [
	"default offset for a tileMatrixStack"
	
	^ 100
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 20:23'
}
GMTETileMatrixStack >> basicVisible: aBool [

	visible := aBool
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 20:19'
}
GMTETileMatrixStack >> blendLayer: anIdx1 with: anIdx2 [

	| topIdx bottomIdx bottomLayer topLayer bottomCell topCell newCellEntry |
	((self layer: anIdx1) belowLayer: (self layer: anIdx2))
		ifTrue: [
			bottomLayer := self layer: anIdx1.
			topLayer := self layer: anIdx2.
			topIdx := anIdx2.
			bottomIdx := anIdx1]
		ifFalse: [
			bottomLayer := self layer: anIdx2.
			topLayer := self layer: anIdx1.
			topIdx := anIdx1.
			bottomIdx := anIdx2].
		
	1 to: bottomLayer columnCount do: [:x |
		1 to: bottomLayer rowCount do: [:y |
			bottomCell := bottomLayer at: y at: x.
			topCell := topLayer at: y at: x.
			bottomCell 
				ifNil: [
					newCellEntry := topCell veryDeepCopy.
					topCell ifNotNil: [topCell owner addMorph: newCellEntry].
					bottomLayer addTile: newCellEntry at: y at: x]
				ifNotNil: [
					newCellEntry := bottomCell asBlendedWithImageMorph: topCell.
					bottomCell updateSprite: newCellEntry image]]].
	
	self removeLayerAt: topIdx.
	^ bottomIdx
	
		
	
	
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:29'
}
GMTETileMatrixStack >> blendLayers: aSet [

	self reduceLayers: (self sortLayerSet: aSet) withBinaryBlock: [ :anIdx1 :anIdx2 | 
		self blendLayer: anIdx1 with: anIdx2]
]

{
	#category : #eumerating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 21:30'
}
GMTETileMatrixStack >> collectLayers: aBlock [

	^ self matrixLayers collect: [:layer | aBlock value: layer]
]

{
	#category : #eumerating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 19:53'
}
GMTETileMatrixStack >> doLayers: aBlock [

	self matrixLayers do: [:layer | aBlock value: layer]
]

{
	#category : #eumerating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 19:53'
}
GMTETileMatrixStack >> doTiles: aBlock [

	self doLayers: [:layer | layer doTiles: aBlock]
]

{
	#category : #eumerating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 19:53'
}
GMTETileMatrixStack >> doTilesXYLidx: aBlock [

	1 to: self width do: [:x | 
		1 to: self height do: [:y |
			1 to: self layerCount do: [:layerIdx | 
				aBlock value: x value: y value: layerIdx]]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:28'
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
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/18/2024 10:09'
}
GMTETileMatrixStack >> hideLayer: anIdx [

	(self layer: anIdx) visible: false
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:16'
}
GMTETileMatrixStack >> hideLayers: aSet [

	self mapLayers: (self sortLayerSet: aSet) withUnaryBlock: [ :layerIdx |
		self hideLayer: layerIdx]
]

{
	#category : #initilization,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:44'
}
GMTETileMatrixStack >> initialize [

	super initialize.
	self
		matrixLayers: LinkedList new;
		visible: true
	"TODO: no base layer created"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:29'
}
GMTETileMatrixStack >> layer: aLayerIdx [
	
	^ self matrixLayers at: aLayerIdx
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 19:58'
}
GMTETileMatrixStack >> layer: aLayerIdx at: y at: x [ 

	^ (self matrixLayers at: aLayerIdx) at: y at: x
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 19:58'
}
GMTETileMatrixStack >> layer: aLayerIdx at: y at: x put: aTile [
	
	^ (self matrixLayers at: aLayerIdx) addTile: aTile at: y at: x
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:29'
}
GMTETileMatrixStack >> layerCount [

	^ self matrixLayers size
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/23/2024 20:01'
}
GMTETileMatrixStack >> layerNameOf: anIdx [

	^ (self layer: anIdx) displayName
]

{
	#category : #checking,
	#'squeak_changestamp' : 'jj 6/22/2024 16:29'
}
GMTETileMatrixStack >> layerVisible: anIdx [

	^ (self layer: anIdx) visible
]

{
	#category : #'multiselect-helpers',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 19:54'
}
GMTETileMatrixStack >> mapLayers: anOrderedCollection withUnaryBlock: aBlock [

	| tmpResult |
	tmpResult := OrderedCollection new.
	
	anOrderedCollection do: [:layerIdx | 
		tmpResult add: (aBlock value: layerIdx)].
	
	^ tmpResult	
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:29'
}
GMTETileMatrixStack >> matrixLayers [

	^ matrixLayers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:27'
}
GMTETileMatrixStack >> matrixLayers: anObject [

	matrixLayers := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:29'
}
GMTETileMatrixStack >> morphicLayerStartingOffset [

	^ morphicLayerStartingOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:27'
}
GMTETileMatrixStack >> morphicLayerStartingOffset: anObject [

	morphicLayerStartingOffset := anObject
]

{
	#category : #adding,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 21:26'
}
GMTETileMatrixStack >> pushLayer [
	
	self matrixLayers addLast: (GMTETileMatrixLayer 
		width: self width 
		height: self height 
		layerIdx: (self morphicLayerStartingOffset - self layerCount - GMTETileMatrixStack morphicLayerDistance)).
		
	self matrixLayers last displayName: 'Layer ', self layerCount 
]

{
	#category : #'multiselect-helpers',
	#'squeak_changestamp' : 'jj 6/22/2024 16:30'
}
GMTETileMatrixStack >> reduceLayers: anOrderedCollection withBinaryBlock: aBlock [

	| tmpResult |
	self assert: (anOrderedCollection size > 1) description: 'Reduce expects at least 2 elements'.
	
	tmpResult := aBlock value: (anOrderedCollection at: 1) value: (anOrderedCollection at: 2).
	
	3 to: anOrderedCollection size do: [ :layerIdx |
		tmpResult := aBlock value: tmpResult value: (anOrderedCollection at: layerIdx)].

	^ tmpResult
	
	
]

{
	#category : #removing,
	#'squeak_changestamp' : 'jj 6/23/2024 13:43'
}
GMTETileMatrixStack >> removeLayerAt: idx [ 

	| removedLayer |.
	self assert: self matrixLayers size > 1 description: 'Base layer cannot be removed!'.
	
	removedLayer := (self matrixLayers removeLink: (self matrixLayers linkAt: idx)) value.
	removedLayer free
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:11'
}
GMTETileMatrixStack >> removeLayersAt: aSet [

	self mapLayers: (self sortLayerSet: aSet) withUnaryBlock: [ :layerIdx |
		self removeLayerAt: layerIdx]
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TW 6/22/2024 01:27'
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
		
	self matrixLayers: newLayers
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:22'
}
GMTETileMatrixStack >> reset [

	self layerCount to: 2 by: -1 do: [ :layer | self removeLayerAt: layer].
	self resetLayer: 1
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:23'
}
GMTETileMatrixStack >> resetLayer: anIdx [

	(self layer: anIdx) free
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:23'
}
GMTETileMatrixStack >> resetLayers: aSet [

	self mapLayers: (self sortLayerSet: aSet) withUnaryBlock: [ :layerIdx |
		self resetLayer: layerIdx]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/23/2024 20:02'
}
GMTETileMatrixStack >> setLayerNameOf: anIdx to: aString [

	^ (self layer: anIdx) displayName: aString
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/18/2024 10:09'
}
GMTETileMatrixStack >> showLayer: anIdx [

	(self layer: anIdx) visible: true
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:17'
}
GMTETileMatrixStack >> showLayers: aSet [

	self mapLayers: (self sortLayerSet: aSet) withUnaryBlock: [ :layerIdx |
		self showLayer: layerIdx]
]

{
	#category : #'multiselect-helpers',
	#'squeak_changestamp' : 'jj 6/22/2024 16:30'
}
GMTETileMatrixStack >> sortLayerSet: aSet [
	"Defines order of how layerIdx sets are supposed to be sorted and updated to save on index updates"

	| layerCollection |
	
	layerCollection := SortedCollection new.
	aSet do: [ :layerIdx | 
		layerCollection add: layerIdx].
	^ layerCollection reverse
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 21:22'
}
GMTETileMatrixStack >> swapLayer: anIdx1 with: anIdx2 [

	| tmpMorhpicLayer layer1 layer2 |
	layer1 := self layer: anIdx1.
	layer2 := self layer: anIdx2.
	tmpMorhpicLayer := layer1 layerIdx.
	
	layer1 updateLayerTo: layer2 layerIdx.
	layer2 updateLayerTo: tmpMorhpicLayer.

	self matrixLayers swap: anIdx1 with: anIdx2
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 23:13'
}
GMTETileMatrixStack >> toggleLayerVisibility: anIdx [

	(self layerVisible: anIdx)
		ifTrue: [self hideLayer: anIdx]
		ifFalse: [self showLayer: anIdx]
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:46'
}
GMTETileMatrixStack >> toggleVisibility [

	self visible
		ifTrue: [self visible: false]
		ifFalse: [self visible: true]
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:30'
}
GMTETileMatrixStack >> visible [

	^ visible
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 20:23'
}
GMTETileMatrixStack >> visible: aBool [

	self basicVisible: aBool.
		
	self doLayers: [ :aLayer | 
		aLayer visible: aBool]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:30'
}
GMTETileMatrixStack >> width [

	^ width
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:28'
}
GMTETileMatrixStack >> width: anObject [

	width := anObject
]

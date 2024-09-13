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
	#category : #'instance creation',
	#'squeak_changestamp' : 'jj 6/23/2024 17:02'
}
GMTETileMatrixStack class >> fromWidth: aWidth height: aHeight [

	^ self fromWidth: aWidth height: aHeight morphicLayerOffset: GMTETileMatrixStack morphicLayerOffsetDefault 
		
]

{
	#category : #'instance creation',
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
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 23:43'
}
GMTETileMatrixStack class >> morphicLayerDistance [
	"Distance between two layers"

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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:50'
}
GMTETileMatrixStack >> blendLayer: anIndex1 with: anIndex2 [
	"Blend two layers (arg ordered must not be considered)"

	| topIndex bottomIndex bottomLayer topLayer bottomCell topCell newCellEntry |
	((self layer: anIndex1) belowLayer: (self layer: anIndex2))
		ifTrue: [
			bottomLayer := self layer: anIndex1.
			topLayer := self layer: anIndex2.
			topIndex := anIndex2.
			bottomIndex := anIndex1]
		ifFalse: [
			bottomLayer := self layer: anIndex2.
			topLayer := self layer: anIndex1.
			topIndex := anIndex1.
			bottomIndex := anIndex2].
		
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
	
	self removeLayerAt: topIndex.
	^ bottomIndex
	
		
	
	
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:29'
}
GMTETileMatrixStack >> blendLayers: aSet [

	self reduceLayers: (self sortLayerSet: aSet) withBinaryBlock: [:anIndex1 :anIndex2 | 
		self blendLayer: anIndex1 with: anIndex2]
]

{
	#category : #eumerating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:42'
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
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 23:33'
}
GMTETileMatrixStack >> doLayersWithIds: aBlock [
	
	| layerNumber |
	layerNumber := self matrixLayers size.
	(1 to: layerNumber) do: [:i | aBlock value: (self matrixLayers at: i) value: i]
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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:43'
}
GMTETileMatrixStack >> doTilesXYLindex: aBlock [
	"For every tile in every layer run a aBlock with arguments [:x :y :layerIndex | ...]"

	1 to: self width do: [:x | 
		1 to: self height do: [:y |
			1 to: self layerCount do: [:layerIndex | 
				aBlock value: x value: y value: layerIndex]]]
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
GMTETileMatrixStack >> hideLayer: anIndex [

	(self layer: anIndex) visible: false
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:16'
}
GMTETileMatrixStack >> hideLayers: aSet [

	self mapLayers: (self sortLayerSet: aSet) withUnaryBlock: [:layerIndex |
		self hideLayer: layerIndex]
]

{
	#category : #initilization,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 23:42'
}
GMTETileMatrixStack >> initialize [

	super initialize.
	self
		matrixLayers: OrderedCollection new;
		visible: true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:29'
}
GMTETileMatrixStack >> layer: aLayerIndex [
	
	^ self matrixLayers at: aLayerIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 19:58'
}
GMTETileMatrixStack >> layer: aLayerIndex at: y at: x [ 

	^ (self matrixLayers at: aLayerIndex) at: y at: x
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 19:58'
}
GMTETileMatrixStack >> layer: aLayerIndex at: y at: x put: aTile [
	
	^ (self matrixLayers at: aLayerIndex) addTile: aTile at: y at: x
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
GMTETileMatrixStack >> layerNameOf: anIndex [

	^ (self layer: anIndex) displayName
]

{
	#category : #checking,
	#'squeak_changestamp' : 'jj 6/22/2024 16:29'
}
GMTETileMatrixStack >> layerVisible: anIndex [

	^ (self layer: anIndex) visible
]

{
	#category : #'multiselect-helpers',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 23:42'
}
GMTETileMatrixStack >> mapLayers: anOrderedCollection withUnaryBlock: aBlock [
	"Run an unary aBlock for every member of anOrderedCollection and return the result"
	
	^ anOrderedCollection collect: [ :layerIndex | (aBlock value: layerIndex)]
	
	
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
	#'squeak_changestamp' : 'Alex M 7/10/2024 02:54'
}
GMTETileMatrixStack >> pushLayer [
	
	self pushLayers: {self layerCount + 1}
]

{
	#category : #adding,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/12/2024 23:32'
}
GMTETileMatrixStack >> pushLayers: indexList [

	| newLayer |
	indexList do: [:i |
		newLayer := (GMTETileMatrixLayer 
			width: self width 
			height: self height 
			layerIndex: (self morphicLayerStartingOffset - self layerCount - GMTETileMatrixStack morphicLayerDistance))
			displayName: 'Layer ', i;
			yourself.
		(i = 1)
			ifTrue: [self matrixLayers addFirst: newLayer]
			ifFalse: [self matrixLayers add: newLayer afterIndex: i-1]]
]

{
	#category : #'multiselect-helpers',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:49'
}
GMTETileMatrixStack >> reduceLayers: anOrderedCollection withBinaryBlock: aBlock [
	"Run a binary aBlock over anOrderedCollection and reduce to a single return value"

	| tmpResult |
	self assert: (anOrderedCollection size > 1) description: 'Reduce expects at least 2 elements'.
	
	tmpResult := aBlock value: (anOrderedCollection at: 1) value: (anOrderedCollection at: 2).
	
	3 to: anOrderedCollection size do: [:layerIndex |
		tmpResult := aBlock value: tmpResult value: (anOrderedCollection at: layerIndex)].

	^ tmpResult
	
	
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Alex M 7/10/2024 03:42'
}
GMTETileMatrixStack >> removeLayerAt: index [ 

	| removedLayer |.
	self assert: self matrixLayers size > 1 description: 'Base layer cannot be removed!'.
	
	removedLayer := (self matrixLayers removeAt: index) value.
	removedLayer free
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:11'
}
GMTETileMatrixStack >> removeLayersAt: aSet [

	self mapLayers: (self sortLayerSet: aSet) withUnaryBlock: [:layerIndex |
		self removeLayerAt: layerIndex]
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Alex M 7/12/2024 19:53'
}
GMTETileMatrixStack >> rescaleToWidth: aWidth height: aHeight [
	"This will rescale layers be recreating them"

	| newLayers newLayer |
	self 
		width: aWidth;
		height: aHeight. 
	
	newLayers := OrderedCollection new.

	self doLayers: [:layer | 
		newLayer := layer asRescaledToWidth: aWidth height: aHeight.
		newLayers addLast: newLayer.
		layer free].
		
	self matrixLayers: newLayers
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:49'
}
GMTETileMatrixStack >> reset [
	"Remove all layers (except base layer) and free all tiles"

	self layerCount to: 2 by: -1 do: [:layer | self removeLayerAt: layer].
	self resetLayer: 1
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:23'
}
GMTETileMatrixStack >> resetLayer: anIndex [

	(self layer: anIndex) free
]

{
	#category : #removing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:23'
}
GMTETileMatrixStack >> resetLayers: aSet [

	self mapLayers: (self sortLayerSet: aSet) withUnaryBlock: [:layerIndex |
		self resetLayer: layerIndex]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/23/2024 20:02'
}
GMTETileMatrixStack >> setLayerNameOf: anIndex to: aString [

	^ (self layer: anIndex) displayName: aString
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/18/2024 10:09'
}
GMTETileMatrixStack >> showLayer: anIndex [

	(self layer: anIndex) visible: true
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/20/2024 20:17'
}
GMTETileMatrixStack >> showLayers: aSet [

	self mapLayers: (self sortLayerSet: aSet) withUnaryBlock: [:layerIndex |
		self showLayer: layerIndex]
]

{
	#category : #'multiselect-helpers',
	#'squeak_changestamp' : 'jj 6/22/2024 16:30'
}
GMTETileMatrixStack >> sortLayerSet: aSet [
	"Defines order of how layerIndex sets are supposed to be sorted and updated to save on index updates"

	| layerCollection |
	
	layerCollection := SortedCollection new.
	aSet do: [:layerIndex | 
		layerCollection add: layerIndex].
	^ layerCollection reverse
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/23/2024 21:22'
}
GMTETileMatrixStack >> swapLayer: anIndex1 with: anIndex2 [

	| tmpMorhpicLayer layer1 layer2 |
	layer1 := self layer: anIndex1.
	layer2 := self layer: anIndex2.
	tmpMorhpicLayer := layer1 layerIndex.
	
	layer1 updateLayerTo: layer2 layerIndex.
	layer2 updateLayerTo: tmpMorhpicLayer.

	self matrixLayers swap: anIndex1 with: anIndex2
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Alex M 7/12/2024 19:00'
}
GMTETileMatrixStack >> tileLossAfterRescaleToWidth: aWidth height: aHeight [

	| removedTiles |
	removedTiles := Dictionary new.
	
	self doLayersWithIds: [:layer :id |
		removedTiles addAll: (layer tileLossAfterRescaleToWidth: aWidth height: aHeight layerId: id)].
	
	^ removedTiles
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 23:13'
}
GMTETileMatrixStack >> toggleLayerVisibility: anIndex [

	(self layerVisible: anIndex)
		ifTrue: [self hideLayer: anIndex]
		ifFalse: [self showLayer: anIndex]
	
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
		
	self doLayers: [:aLayer | 
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

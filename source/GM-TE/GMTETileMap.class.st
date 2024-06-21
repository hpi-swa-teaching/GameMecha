Class {
	#name : #GMTETileMap,
	#superclass : #Morph,
	#instVars : [
		'mapTileWidth',
		'mapTileHeight',
		'mapPadding',
		'mapPaddedWidth',
		'tileSizeWidth',
		'tileSizeHeight',
		'tileSizeRatio',
		'mapSizeWidth',
		'mapSizeHeight',
		'borderSizeTotalWidth',
		'borderSizeTotalHeight',
		'borderTileWidth',
		'borderTileHeight',
		'tileWidth',
		'tileHeight',
		'fullGridSizeWidth',
		'fullGridSizeHeight',
		'tileCornerOffsetMap',
		'tileCornerOffsetBackground',
		'mapPaddedHeight',
		'tileMatrixStack',
		'tileMatrixStackHighlighting',
		'tileMatrixStackBackground',
		'forceMapSizeRatio',
		'backgroundTiles',
		'autoGenerateBackground'
	],
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:52'
}
GMTETileMap class >> newFromEditableTileMap: aMap [

	| newMap |

	aMap tileSelectionSet clearAllHighlightings.
	
	aMap tileMatrixStackBackground reset. "This fixed the temporary issue of orphaned morphs after copy"
	
	newMap := (GMTETileMap newFrom: (aMap veryDeepCopy)) 
		updateMap;
		hideHighlightingLayer;
		yourself.
		
	
	 aMap generateBackgroundTiles. "Part of the above fix"
	^newMap 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JS 6/4/2024 16:56'
}
GMTETileMap class >> tileWidth: aWidth tileHeight: aHeight padding: aPadding sizeRatio: aRatio [
	
	^ self new
		setDimensionsWidth: aWidth height: aHeight padding: aPadding;
		tileSizeRatio: aRatio
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 22:00'
}
GMTETileMap >> HighlightingTileFromPosition: aPoint [

	| idx |
	
	idx := self tileIdxFromPosition: aPoint.
	idx ifNil: [^nil].
	
	^ self tileMatrixStackHighlighting layer: 1 at: idx y at: idx x.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 23:07'
}
GMTETileMap >> autoGenerateBackground [

	^ autoGenerateBackground
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 23:08'
}
GMTETileMap >> autoGenerateBackground: aBool [

	autoGenerateBackground := aBool.
	
	aBool
		ifTrue: []
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 22:28'
}
GMTETileMap >> backgroundTiles [

	^ backgroundTiles
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 23:33'
}
GMTETileMap >> backgroundTiles: anObject [

	backgroundTiles := anObject.
	
	"TODO: keep this here?"
	self updateMap
	
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:43'
}
GMTETileMap >> blendLayers: aSet [

	self tileMatrixStack blendLayers: aSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> borderSizeTotalHeight [

	^ borderSizeTotalHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> borderSizeTotalHeight: anObject [

	borderSizeTotalHeight := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> borderSizeTotalWidth [

	^ borderSizeTotalWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> borderSizeTotalWidth: anObject [

	borderSizeTotalWidth := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> borderTileHeight [

	^ borderTileHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> borderTileHeight: anObject [

	borderTileHeight := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> borderTileWidth [

	^ borderTileWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> borderTileWidth: anObject [

	borderTileWidth := anObject.
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:53'
}
GMTETileMap >> correctedTilePosition: aPoint startingOffset: anOffset [
	"comment stating purpose of message"
	
	^ (aPoint + anOffset + self topLeft) floor	
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:54'
}
GMTETileMap >> correctedTilePositionBackground: aPoint [
	"comment stating purpose of message"
	
	^ self correctedTilePosition: aPoint startingOffset: self tileCornerOffsetBackground
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:53'
}
GMTETileMap >> correctedTilePositionMap: aPoint [
	"comment stating purpose of message"
	
	^ self correctedTilePosition: aPoint startingOffset: self tileCornerOffsetMap
]

{
	#category : #checking,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 23:35'
}
GMTETileMap >> dimensionsSet [

	^(self mapTileWidth notNil) and: [(self mapTileWidth notNil) and: [self mapPadding notNil]]
]

{
	#category : #'import/export',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/20/2024 20:54'
}
GMTETileMap >> exportAsImage [
	"Add further options in the future like choosing file format?"
	
	self exportAsPNG
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 22:26'
}
GMTETileMap >> extent: aPoint [

	| oldExtent newExtent |
	
	self forceMapSizeRatio
		ifTrue: [newExtent := (aPoint x)@(aPoint x * (self mapTileHeight / self mapTileWidth))]
		ifFalse: [newExtent := aPoint].
		
	oldExtent := self extent.

	super extent: newExtent.
	
	(oldExtent = newExtent) ifTrue: [^nil].
	self tileMatrixStack ifNotNil: [self rescaleMap].
	
	
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 22:25'
}
GMTETileMap >> fitBackgroundToMap [
	
	self mapPadding: 0.0.
	self forceMapSizeRatio: true.
	self extent: (self mapSizeWidth)@(self mapSizeHeight).
	self changed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/18/2024 19:22'
}
GMTETileMap >> forceMapSizeRatio [

	^ forceMapSizeRatio
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/18/2024 19:22'
}
GMTETileMap >> forceMapSizeRatio: anObject [

	forceMapSizeRatio := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> fullGridSizeHeight [

	^ fullGridSizeHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> fullGridSizeHeight: anObject [

	fullGridSizeHeight := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> fullGridSizeWidth [

	^ fullGridSizeWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> fullGridSizeWidth: anObject [

	fullGridSizeWidth := anObject.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 23:30'
}
GMTETileMap >> generateBackgroundTiles [
	
	self backgroundTiles ifNil: [^nil].
	
	self tileMatrixStackBackground doTilesXYLidx: [ :x :y :l | 
		"It is assumed that the visual stack consists of only one layer"
		self generateTileAtlayer: l x: x y: y stack: self tileMatrixStackBackground tileType: GMTETile posCorrectionBlock: [ :aPoint |
			self correctedTilePositionBackground: aPoint]].
	
	self tileMatrixStackBackground doTiles: [ :tile |
		tile applyTileSprite: self backgroundTiles]
	
	"self tileMatrixStackBackground doTiles: [ :tile | 
		tile borderColor: Color veryLightGray]"
	

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 22:00'
}
GMTETileMap >> generateHighlightingTiles [
	
	self tileMatrixStackHighlighting doTilesXYLidx: [ :x :y :l | 
		"It is assumed that the visual stack consists of only one layer"
		self generateTileAtlayer: l x: x y: y stack: self tileMatrixStackHighlighting tileType: GMTETileHighlighting].
	

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 22:00'
}
GMTETileMap >> generateMatrixStacks [
	
	self tileMatrixStackBackground: (GMTETileMatrixStack fromWidth: self tileWidth height: self tileHeight morphicLayerOffset: 101).
	self tileMatrixStack: (GMTETileMatrixStack fromWidth: self mapTileWidth height: self mapTileHeight morphicLayerOffset: 100).
	self tileMatrixStackHighlighting: (GMTETileMatrixStack fromWidth: self mapTileWidth height: self mapTileHeight morphicLayerOffset: 10). "TODO: Number ?"
	"self generateBackgroundTiles."
	self generateHighlightingTiles.
	self toggleBackgroundLayer
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 23:00'
}
GMTETileMap >> generateTileAtlayer: aLayer x: x y: y stack: aStack tileType: aTileClass [

	^self generateTileAtlayer: aLayer x: x y: y stack: aStack tileType: aTileClass posCorrectionBlock: [ :aPoint | 
		self correctedTilePositionMap: aPoint]

	
		
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 22:59'
}
GMTETileMap >> generateTileAtlayer: aLayer x: x y: y stack: aStack tileType: aTileClass posCorrectionBlock: aBlock [

	| tilePos correctedTilePos newTile |
	
	tilePos := self tilePosFromVirtual: x@y.
	correctedTilePos := aBlock value: tilePos.
						
	newTile := (aTileClass
		position: correctedTilePos
		extent: self tileSizeWidth@self tileSizeHeight) 
		lock;
		beTransparent;
		yourself.
	
	self addMorph: newTile.
	aStack layer: aLayer at: y at: x put: newTile.
	^newTile

	
		
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/12/2024 17:40'
}
GMTETileMap >> getTileFromLayer: aLayer x: x y: y [
	
	^self getTileFromLayer: aLayer x: x y: y stack: self tileMatrixStack

	
		
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/12/2024 17:38'
}
GMTETileMap >> getTileFromLayer: aLayer x: x y: y stack: aStack [
	
	^aStack layer: aLayer at: y at: x

	
		
	
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:52'
}
GMTETileMap >> hideHighlightingLayer [

	self tileMatrixStackHighlighting visible: false.
	self changed
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:49'
}
GMTETileMap >> initialize [
	
	super initialize.
	self 
		color: Color lightGray;
		clipSubmorphs: true;
		forceMapSizeRatio: false;
		autoGenerateBackground: true;
		
		"TODO: spike solution. Size 1@1 sets quadratic base image. Generic resizing not working yet"
		"TODO: default background tiles (must not exist but practical as a visual indicator)"
		 backgroundTiles: ((GMTETileHighlighting new) setPlaceholderWithExtent: 1@1 color: Color brown; yourself)
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/4/2024 15:51'
}
GMTETileMap >> isTileMap [
	^ isTileMap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JS 6/4/2024 15:51'
}
GMTETileMap >> isTileMap: anObject [
	isTileMap := anObject
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 22:53'
}
GMTETileMap >> mapGridOnly [
	
	self fitBackgroundToMap.
	self color: Color transparent.
	self changed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapPaddedHeight [

	^ mapPaddedHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapPaddedHeight: anObject [

	mapPaddedHeight := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapPaddedWidth [

	^ mapPaddedWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapPaddedWidth: anObject [

	mapPaddedWidth := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapPadding [

	^ mapPadding
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapPadding: anObject [

	mapPadding := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapSizeHeight [

	^ mapSizeHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapSizeHeight: anObject [

	mapSizeHeight := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapSizeWidth [

	^ mapSizeWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapSizeWidth: anObject [

	mapSizeWidth := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapTileHeight [

	^ mapTileHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapTileHeight: anObject [

	mapTileHeight := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapTileWidth [

	^ mapTileWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> mapTileWidth: anObject [

	mapTileWidth := anObject.
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'TW 6/20/2024 17:17'
}
GMTETileMap >> mergeLayers: aSet [

	^ true
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:42'
}
GMTETileMap >> removeLayers: aSet [

	self tileMatrixStack removeLayersAt: aSet
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:37'
}
GMTETileMap >> rescaleMap [

	self rescaleMapWidth: self mapTileWidth height: self mapTileHeight padding: self mapPadding
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/8/2024 21:40'
}
GMTETileMap >> rescaleMapWidth: aWidth height: aHeigth [
	
	self rescaleMapWidth: aWidth height: aHeigth padding: self mapPadding
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/8/2024 21:59'
}
GMTETileMap >> rescaleMapWidth: aWidth height: aHeigth padding: aPadding [
	"Rescale map & trigger update"
	
	"Warning: If padding is to small relative to map, divisions by zero can occur"
	| sizeChanged |
	sizeChanged := (aWidth ~= self mapTileWidth) or: [aHeigth ~= self mapTileHeight].

	self setDimensionsWidth: aWidth height: aHeigth padding: aPadding.
	(sizeChanged) ifTrue: [
		self rescaleMatrixStacks].
	self updateMap
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 22:00'
}
GMTETileMap >> rescaleMatrixStacks [

	(self tileMatrixStack) ifNotNil: [
		self tileMatrixStack rescaleToWidth: self mapTileWidth height: self mapTileHeight].
		"Rescaling returns a copy of the original tiles, which must be added as submorphs again. TODO: move responsibility to Stack?"
		self tileMatrixStack doTiles: [ :tile |
			self addMorph: tile].
	(self tileMatrixStackHighlighting) ifNotNil: [
		self tileMatrixStackHighlighting rescaleToWidth: self mapTileWidth height: self mapTileHeight.
		self tileMatrixStackHighlighting reset.
		self generateHighlightingTiles]
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:42'
}
GMTETileMap >> resetAllLayers: aSet [

	self tileMatrixStack reset
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:41'
}
GMTETileMap >> resetLayers: aSet [

	self tileMatrixStack resetLayers: aSet
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:53'
}
GMTETileMap >> revertCorrectedTilePosition: aPoint startingOffset: anOffset [
	"comment stating purpose of message"

	^ aPoint - anOffset - self topLeft	
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:54'
}
GMTETileMap >> revertCorrectedTilePositionBackground: aPoint [
	"comment stating purpose of message"

	^ self revertCorrectedTilePosition: aPoint startingOffset: self tileMatrixStackBackground
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:54'
}
GMTETileMap >> revertCorrectedTilePositionMap: aPoint [
	"comment stating purpose of message"

	^ self revertCorrectedTilePosition: aPoint startingOffset: self tileCornerOffsetMap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/8/2024 21:00'
}
GMTETileMap >> setDimensionsWidth: aWidth height: aHeigth padding: aPadding [
	"Set dimensions (defines what is considered as part of 'dimensions')"

	self
		mapTileWidth: aWidth;
		mapTileHeight: aHeigth;
		mapPadding: aPadding
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:52'
}
GMTETileMap >> showHighlightingLayer [

	self tileMatrixStackHighlighting visible: true.
	self changed
	"self rescaleMap."
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:42'
}
GMTETileMap >> tileCornerOffsetBackground [

	^ tileCornerOffsetBackground
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:42'
}
GMTETileMap >> tileCornerOffsetBackground: anObject [

	tileCornerOffsetBackground := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:40'
}
GMTETileMap >> tileCornerOffsetMap [

	^ tileCornerOffsetMap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:40'
}
GMTETileMap >> tileCornerOffsetMap: anObject [

	tileCornerOffsetMap := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 23:01'
}
GMTETileMap >> tileFromPosition: aPoint layer: aLayer [

	| idx |
	
	idx := self tileIdxFromPosition: aPoint.
	idx ifNil: [^nil].
	
	^ self tileMatrixStack layer: aLayer at: idx y at: idx x.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> tileHeight [

	^ tileHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> tileHeight: anObject [

	tileHeight := anObject.
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:49'
}
GMTETileMap >> tileIdxFromPosition: aPoint [

	| uncorrectedPos idx |
	
	uncorrectedPos := self revertCorrectedTilePositionMap: aPoint.
	idx := (uncorrectedPos x / self tileSizeWidth + 1)@(uncorrectedPos y / self tileSizeHeight + 1).
	idx := idx floor.
	
	((self tileMatrixStackHighlighting layer: 1) validIdx: idx) ifFalse: [^nil].
	^idx.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 22:03'
}
GMTETileMap >> tileMatrixStack [

	^ tileMatrixStack
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 22:03'
}
GMTETileMap >> tileMatrixStack: anObject [

	tileMatrixStack := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:43'
}
GMTETileMap >> tileMatrixStackBackground [

	^ tileMatrixStackBackground
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:43'
}
GMTETileMap >> tileMatrixStackBackground: anObject [

	tileMatrixStackBackground := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:50'
}
GMTETileMap >> tileMatrixStackHighlighting [

	^ tileMatrixStackHighlighting
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:50'
}
GMTETileMap >> tileMatrixStackHighlighting: anObject [

	tileMatrixStackHighlighting := anObject.
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 15:42'
}
GMTETileMap >> tilePosFromVirtual: aPoint [

	^ (aPoint x - 1 * self tileSizeWidth)@(aPoint y - 1 * self tileSizeHeight)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 16:09'
}
GMTETileMap >> tileSizeHeight [

	^ tileSizeHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 16:09'
}
GMTETileMap >> tileSizeHeight: anObject [

	tileSizeHeight := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 16:34'
}
GMTETileMap >> tileSizeRatio [

	^ tileSizeRatio
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 16:34'
}
GMTETileMap >> tileSizeRatio: anObject [

	tileSizeRatio := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> tileSizeWidth [

	^ tileSizeWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> tileSizeWidth: anObject [

	tileSizeWidth := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> tileWidth [

	^ tileWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> tileWidth: anObject [

	tileWidth := anObject.
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 22:49'
}
GMTETileMap >> toForeground [
	"Squeak Bar is 77.
	(layerScreen - n) is the nth layer.
	Most regular Physics Objects are Layer 2."

	self morphicLayerNumber: 76
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 22:51'
}
GMTETileMap >> toFullScreen [


	self extent: Display extent.
	self position: 0@0.
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 22:52'
}
GMTETileMap >> toFullScreenMode [

	self toForeground.
	self toFullScreen.
	self lock
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 23:21'
}
GMTETileMap >> toggleBackgroundLayer [

	self tileMatrixStackBackground toggleVisibility.
	"This is necessary since background updates are not applied during invisibilty for performance reasons"
	(self tileMatrixStackBackground visible) ifTrue: [
		self updateTiles].
	self changed
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:52'
}
GMTETileMap >> toggleHighlightingLayer [

	self tileMatrixStackHighlighting toggleVisibility.
	self changed
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:42'
}
GMTETileMap >> updateDimensions [
	"Adjust map grid dimensions to screen size & calculate dependent values"

	| maxTileSizeWidth maxTileSizeHeight |
	"Adjust for border padding"
	self mapPaddedWidth: self width * (1 - self mapPadding).
	self mapPaddedHeight: self height * (1 - self mapPadding).
	
	"Calculate maximum tile width for x and y dimension"
	maxTileSizeWidth := self mapPaddedWidth // self mapTileWidth.
	maxTileSizeHeight := self mapPaddedHeight // self mapTileHeight.
	
	"Choose smalles length as common denominator"
	(self tileSizeRatio < (maxTileSizeWidth / maxTileSizeHeight))
		ifTrue: [maxTileSizeWidth := (maxTileSizeHeight * self tileSizeRatio)]
		ifFalse: [maxTileSizeHeight := (maxTileSizeWidth // self tileSizeRatio)].
	self tileSizeWidth: maxTileSizeWidth.
	self tileSizeHeight: maxTileSizeHeight.	
	
	"Calculate proper map size with selected tile size"
	self mapSizeWidth: self tileSizeWidth * self mapTileWidth.
	self mapSizeHeight: self tileSizeHeight * self mapTileHeight.
	
	"Calculate border dimensions"
	self borderSizeTotalWidth: self width - self mapSizeWidth.
	self borderSizeTotalHeight: self height - self mapSizeHeight.
	
	"Calculate tile count at each border"
	self borderTileWidth: (self borderSizeTotalWidth / 2 / self tileSizeWidth) ceiling.
	self borderTileHeight: (self borderSizeTotalHeight / 2 / self tileSizeHeight) ceiling.
	
	"Added border tiles to total tile count"
	"TODO: just remove border related logic?"
	self tileWidth: 2 * self borderTileWidth + self mapTileWidth.
	self tileHeight: 2 * self borderTileHeight + self mapTileHeight.
	"self tileWidth: self mapTileWidth."
	"self tileHeight: self mapTileHeight."
	
	"Calculate total width and height of grid (pixels)"
	self fullGridSizeWidth: self tileWidth * self tileSizeWidth.
	self fullGridSizeHeight: self tileHeight * self tileSizeHeight.
	
	"Set tile corner offset to display grid (bigger than screen) centered"
	self tileCornerOffsetMap: 
		(self mapSizeWidth - self width // 2 negated)@(self mapSizeHeight - self height // 2 negated).
	self tileCornerOffsetBackground:
		(self fullGridSizeWidth - self width // 2 negated)@(self fullGridSizeHeight - self height // 2 negated)
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 23:36'
}
GMTETileMap >> updateMap [
	"Update map by: fitting grid to current screen, generating tile matrix, adding sprites"
	self dimensionsSet ifFalse: [^nil].
	
	self updateDimensions.
	self tileMatrixStack 
		ifNil: [self generateMatrixStacks] "TODO: shouldnt this be properly initialized?"
		ifNotNil: [self updateTiles]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 23:02'
}
GMTETileMap >> updateTileMatrixStack: aStack [

	self updateTileMatrixStack: aStack posCorrectionBlock: [ :aPoint | 
		self correctedTilePositionMap: aPoint]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/19/2024 21:51'
}
GMTETileMap >> updateTileMatrixStack: aStack posCorrectionBlock: aBlock [

	| tilePos correctedTilePos tile |
	
	aStack doTilesXYLidx: [ :x :y :l | 
		tilePos := self tilePosFromVirtual: x@y.
		correctedTilePos := aBlock value: tilePos.
		tile := aStack layer: l at: y at: x.
		
		tile ifNotNil: [
			tile 
			position: correctedTilePos;
			extent: self tileSizeWidth@self tileSizeHeight]].
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/21/2024 21:49'
}
GMTETileMap >> updateTiles [

	"Background also has to rescale"
	"TODO: This should be refactored"
	"TODO: Rescaling is not very performant"
	
	(self tileMatrixStackBackground visible) 
		ifTrue: [
			self tileMatrixStackBackground rescaleToWidth: self tileWidth height: self tileHeight.
			self tileMatrixStackBackground reset.
			self generateBackgroundTiles.
			self updateTileMatrixStack: self tileMatrixStackBackground posCorrectionBlock: [ :aPoint | 
				self correctedTilePositionBackground: aPoint]].
	
	self updateTileMatrixStack: self tileMatrixStack.
	self updateTileMatrixStack: self tileMatrixStackHighlighting.
]

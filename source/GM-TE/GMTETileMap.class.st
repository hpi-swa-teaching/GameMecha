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
		'tileCornerOffset',
		'mapPaddedHeight',
		'tileMatrixStack',
		'tileMatrixStackVisual'
	],
	#category : #'GM-TE-Core'
}

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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 21:16'
}
GMTETileMap >> correctedTilePosition: aPoint [
	"comment stating purpose of message"

	^ (self tileCornerOffset + aPoint + self topLeft) floor	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:53'
}
GMTETileMap >> disableVisualLayer [

	self tileMatrixStackVisual doTiles: [ :aTile | aTile removeBorderHighlighting]
	
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 21:52'
}
GMTETileMap >> enableVisualLayer [

	self tileMatrixStackVisual doTiles: [ :aTile | aTile applyBorderHighlighting]
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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/7/2024 20:32'
}
GMTETileMap >> extent: aPoint [

	| oldExtent |
	oldExtent := self extent.

	super extent: aPoint.
	
	(oldExtent = aPoint) ifTrue: [^nil].
	self tileMatrixStack ifNotNil: [self rescaleMap].
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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/12/2024 14:26'
}
GMTETileMap >> generateMatrixStacks [
	
	self tileMatrixStack: (GMTETileMatrixStack fromWidth: self tileWidth height: self tileHeight).
	self tileMatrixStackVisual: (GMTETileMatrixStack fromWidth: self tileWidth height: self tileHeight morphicLayerOffset: 10). "TODO: Number ?"
	self generateVisualTiles.
	self enableVisualLayer
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/12/2024 14:19'
}
GMTETileMap >> generateTileAtlayer: aLayer x: x y: y stack: aStack tileType: aTileClass [

	| tilePos correctedTilePos newTile |
	
	tilePos := self tilePosFromVirtual: x@y.
	correctedTilePos := self correctedTilePosition: tilePos.
						
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
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/8/2024 22:13'
}
GMTETileMap >> generateVisualTiles [
	"Create grid tile matrix datastructure"
	
	1 to: self mapTileHeight do: [:y |
		1 to: self mapTileWidth do: [:x |			
			self generateTileAtlayer: 1 x: x y: y stack: self tileMatrixStackVisual tileType: GMTETileVisual]].

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
	#category : #initialization,
	#'squeak_changestamp' : 'TW 5/22/2024 15:48'
}
GMTETileMap >> initialize [
	
	super initialize.
	self color: Color lightGray.
	
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
	#category : #updating,
	#'squeak_changestamp' : 'TW 6/11/2024 17:14'
}
GMTETileMap >> rescaleMap [

	self tileSelectionSet clearAllHighlightings.
	self rescaleMapWidth: self tileWidth height: self tileHeight padding: self mapPadding
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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/11/2024 18:37'
}
GMTETileMap >> rescaleMatrixStacks [

	(self tileMatrixStack) ifNotNil: [
		self tileMatrixStack rescaleToWidth: self mapTileWidth height: self mapTileHeight].
		"Rescaling returns a copy of the original tiles, which must be added as submorphs again. TODO: move responsibility to Stack?"
		self tileMatrixStack doTiles: [ :tile |
			self addMorph: tile].
	(self tileMatrixStackVisual) ifNotNil: [
		self tileMatrixStackVisual rescaleToWidth: self mapTileWidth height: self mapTileHeight.
		self tileMatrixStackVisual reset.
		self generateVisualTiles.
		self enableVisualLayer] "TODO: make "
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 20:20'
}
GMTETileMap >> revertCorrectedTilePosition: aPoint [
	"comment stating purpose of message"

	^ aPoint - self tileCornerOffset - self topLeft	
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
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> tileCornerOffset [

	^ tileCornerOffset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> tileCornerOffset: anObject [

	tileCornerOffset := anObject.
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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 22:58'
}
GMTETileMap >> tileIdxFromPosition: aPoint [

	| uncorrectedPos idx |
	
	uncorrectedPos := self revertCorrectedTilePosition: aPoint.
	idx := (uncorrectedPos x / self tileSizeWidth + 1)@(uncorrectedPos y / self tileSizeHeight + 1).
	idx := idx floor.
	
	((self tileMatrixStackVisual layer: 1) validIdx: idx) ifFalse: [^nil].
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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 22:20'
}
GMTETileMap >> tileMatrixStackVisual [

	^ tileMatrixStackVisual
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 22:20'
}
GMTETileMap >> tileMatrixStackVisual: anObject [

	tileMatrixStackVisual := anObject.
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 20:21'
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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 23:00'
}
GMTETileMap >> tileVisualFromPosition: aPoint [

	| idx |
	
	idx := self tileIdxFromPosition: aPoint.
	idx ifNil: [^nil].
	
	^ self tileMatrixStackVisual layer: 1 at: idx y at: idx x.
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
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 17:52'
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
	"self tileWidth: 2 * self borderTileWidth + self mapTileWidth."
	"self tileHeight: 2 * self borderTileHeight + self mapTileHeight."
	self tileWidth: self mapTileWidth.
	self tileHeight: self mapTileHeight.
	
	"Calculate total width and height of grid (pixels)"
	self fullGridSizeWidth: self tileWidth * self tileSizeWidth.
	self fullGridSizeHeight: self tileHeight * self tileSizeHeight.
	
	"Set tile corner offset to display grid (bigger than screen) centered"
	self tileCornerOffset: 
		(self fullGridSizeWidth - self width // 2 negated)@(self fullGridSizeHeight - self height // 2 negated)
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/8/2024 20:57'
}
GMTETileMap >> updateMap [
	"Update map by: fitting grid to current screen, generating tile matrix, adding sprites"

	self updateDimensions.
	self tileMatrixStack 
		ifNil: [self generateMatrixStacks] "TODO: shouldnt this be properly initialized?"
		ifNotNil: [self updateTiles]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TW 5/28/2024 11:17'
}
GMTETileMap >> updateTileMatrixStack: aStack [

	| tilePos correctedTilePos tile |
	
	1 to: self tileHeight do: [:y |
		1 to: self tileWidth do: [:x |
			1 to: (aStack layerCount) do: [: l |
				
				tilePos := self tilePosFromVirtual: x@y.
				correctedTilePos := self correctedTilePosition: tilePos.
				tile := aStack layer: l at: y at: x.
				
				tile ifNotNil: [
					tile 
					position: correctedTilePos;
					extent: self tileSizeWidth@self tileSizeHeight.]]
			]]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 22:49'
}
GMTETileMap >> updateTiles [

	self updateTileMatrixStack: self tileMatrixStack.
	self updateTileMatrixStack: self tileMatrixStackVisual
]

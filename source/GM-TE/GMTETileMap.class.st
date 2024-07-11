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
		'view'
	],
	#category : #'GM-TE-TileMap'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/23/2024 16:59'
}
GMTETileMap class >> foregroundMorphicLayerNumber [
	"TODO: comment"
	
	^ 76
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jj 6/23/2024 17:50'
}
GMTETileMap class >> maxLayers [
	"the maximum amount of tileMatrixStack layers"
	
	^ 80
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 18:05'
}
GMTETileMap class >> newFromEditableTileMap: aMap [

	| newMap oldMapCopy |
	aMap tileSelectionSet clearAllHighlightings.
	
	oldMapCopy := aMap veryDeepCopy.
	
	newMap := (GMTETileMap newFrom: oldMapCopy)
		updateMap;
		hideHighlightingLayer;
		removeAllMorphs;
		yourself.
	
	oldMapCopy 
		submorphsDo: [:s | newMap addMorph: s];
	 	abandon.
	
	"Initially draw background tiles"
	newMap updateTilesBackground.
	^ newMap 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jj 6/22/2024 16:12'
}
GMTETileMap class >> tileWidth: aWidth tileHeight: aHeight padding: aPadding sizeRatio: aRatio [
	
	^ (self new)
		setDimensionsWidth: aWidth height: aHeight padding: aPadding;
		tileSizeRatio: aRatio
]

{
	#category : #'view-conversion',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 22:20'
}
GMTETileMap >> absPointToViewCenter: aPoint [

	^ (self absPointToViewFraction: aPoint) - (self view extent / 2) 
]

{
	#category : #'view-conversion',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 22:19'
}
GMTETileMap >> absPointToViewFraction: aPoint [

	^aPoint / self extent
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
	#'squeak_changestamp' : 'jj 6/24/2024 11:10'
}
GMTETileMap >> backgroundTiles: anObject [

	self 
		basicBackgroundTiles: anObject;
		updateMap
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/22/2024 01:21'
}
GMTETileMap >> basicBackgroundTiles: anObject [

	backgroundTiles := anObject
	
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:18'
}
GMTETileMap >> borderSizeTotalHeight: anObject [

	borderSizeTotalHeight := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:18'
}
GMTETileMap >> borderSizeTotalWidth: anObject [

	borderSizeTotalWidth := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:18'
}
GMTETileMap >> borderTileHeight: anObject [

	borderTileHeight := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:19'
}
GMTETileMap >> borderTileWidth: anObject [

	borderTileWidth := anObject
]

{
	#category : #view,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/11/2024 00:08'
}
GMTETileMap >> centerViewAt: aPoint [
	"Note: center must induce legal view (non-overlapping)"

	self view moveTo: (self inViewPointToViewCenter: aPoint).
	self updateMap
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:09'
}
GMTETileMap >> correctedTilePosition: aPoint startingOffset: anOffset [
	"Transform a tile position by adding a starting offset"
	
	^ (aPoint + anOffset + self topLeft) floor	
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:10'
}
GMTETileMap >> correctedTilePositionBackground: aPoint [
	"Transform background tile positions correctly (as the stack is larger it has a different starting offset)"
	
	^ self correctedTilePosition: aPoint startingOffset: self tileCornerOffsetBackground
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:11'
}
GMTETileMap >> correctedTilePositionMap: aPoint [
	"Transform map tile positions correctly"
	
	^ self correctedTilePosition: aPoint startingOffset: self tileCornerOffsetMap
]

{
	#category : #checking,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:08'
}
GMTETileMap >> dimensionsSet [
	"Check if attributes regarded as 'dimensions' are properly initialized"

	^ (self mapTileWidth notNil) and: [(self mapTileWidth notNil) and: [self mapPadding notNil]]
]

{
	#category : #'import/export',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:21'
}
GMTETileMap >> exportAsImage [
	"TODO:Add further options in the future like choosing file format?"
	
	self exportAsPNG
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 19:47'
}
GMTETileMap >> extent: aPoint [
	"Override extent to properly scale tile map"

	| oldExtent newExtent |
	self forceMapSizeRatio
		ifTrue: [newExtent := (aPoint x) @ (aPoint x * (self mapTileHeight / self mapTileWidth))]
		ifFalse: [newExtent := aPoint].
		
	oldExtent := self extent.

	super extent: newExtent.
	
	(oldExtent = newExtent) ifTrue: [^ nil].
	self tileMatrixStack ifNotNil: [self rescaleMap]
	
	
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:55'
}
GMTETileMap >> fitBackgroundToMap [
	"Forces the tile map morph to fit the map grid"
	
	self 
		mapPadding: 0.0;
		forceMapSizeRatio: true;
		extent: (self mapSizeWidth) @ (self mapSizeHeight);
		changed
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:19'
}
GMTETileMap >> forceMapSizeRatio: anObject [

	forceMapSizeRatio := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:19'
}
GMTETileMap >> fullGridSizeHeight: anObject [

	fullGridSizeHeight := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:19'
}
GMTETileMap >> fullGridSizeWidth: anObject [

	fullGridSizeWidth := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 17:46'
}
GMTETileMap >> generateBackgroundTiles [
	"Fill the background matrix stack with tiles automatically"
	
	self backgroundTiles ifNil: [^ nil].
	
	self tileMatrixStackBackground doTilesXYLindex: [:x :y :l | 
		"It is assumed that the background stack consists of only one layer"
		self generateTileAtlayer: l x: x y: y stack: self tileMatrixStackBackground tileType: GMTETile posCorrectionBlock: [:aPoint |
			self correctedTilePositionBackground: aPoint]].
	
	self tileMatrixStackBackground doTiles: [:tile |
		tile applyTileSprite: self backgroundTiles]
	
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:27'
}
GMTETileMap >> generateHighlightingTiles [
	"Fill the highlighting matrix stack with tiles automatically"
	
	self tileMatrixStackHighlighting doTilesXYLindex: [:x :y :l | 
		"It is assumed that the visual stack consists of only one layer"
		self generateTileAtlayer: l x: x y: y stack: self tileMatrixStackHighlighting tileType: GMTETileHighlighting]
	

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:22'
}
GMTETileMap >> generateMatrixStacks [
	"Generate the 3 matrix stacks (editable, highlighting, background)"
	
	self tileMatrixStackBackground: (GMTETileMatrixStack fromWidth: self tileWidth height: self tileHeight morphicLayerOffset: GMTETileMatrixStack morphicLayerOffsetDefault + 1).
	self tileMatrixStack: (GMTETileMatrixStack fromWidth: self mapTileWidth height: self mapTileHeight morphicLayerOffset: GMTETileMatrixStack morphicLayerOffsetDefault).
	self tileMatrixStackHighlighting: (GMTETileMatrixStack fromWidth: self mapTileWidth height: self mapTileHeight morphicLayerOffset: GMTETileMatrixStack morphicLayerOffsetDefault - GMTETileMap maxLayers - GMTETileMatrixStack morphicLayerDistance). "ensures that the visual layer is always is front of every other layer"
	"self generateBackgroundTiles."
	self generateHighlightingTiles.
	self toggleBackgroundLayer
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:25'
}
GMTETileMap >> generateTileAtlayer: aLayer x: x y: y stack: aStack tileType: aTileClass [
	"Covenience method to generate tiles on the editable matrix stack"

	^ self generateTileAtlayer: aLayer x: x y: y stack: aStack tileType: aTileClass posCorrectionBlock: [:aPoint | 
		self correctedTilePositionMap: aPoint]

	
		
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/9/2024 11:15'
}
GMTETileMap >> generateTileAtlayer: aLayer x: x y: y stack: aStack tileType: aTileClass posCorrectionBlock: aBlock [
	"Add a tile of type aTileClass to aLayer at position (x, y) in aStack and calculate the correct position using aBlock"

	| tilePos correctedTilePos tileExtent newTile |
	tilePos := self tilePosFromVirtual: x@y.
	correctedTilePos := self viewCorrectedTilePosition: (aBlock value: tilePos).
	tileExtent := self viewCorrectedTileExtent: self tileSizeWidth @ self tileSizeHeight.
						
	newTile := (aTileClass
		position: correctedTilePos
		extent: tileExtent) 
		lock;
		beTransparent;
		yourself.
	
	self addMorph: newTile.
	aStack layer: aLayer at: y at: x put: newTile.

	^ newTile

	
		
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:13'
}
GMTETileMap >> getTileFromLayer: aLayer x: x y: y [
	
	^ self getTileFromLayer: aLayer x: x y: y stack: self tileMatrixStack

	
		
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jj 6/22/2024 16:13'
}
GMTETileMap >> getTileFromLayer: aLayer x: x y: y stack: aStack [
	
	^ aStack layer: aLayer at: y at: x

	
		
	
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:55'
}
GMTETileMap >> hideHighlightingLayer [
	"Hide the grid"

	self 
		tileMatrixStackHighlighting visible: false;
		changed
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 7/6/2024 12:11'
}
GMTETileMap >> highlightingTileFromIndex: anIndex [
	"Answer the sender with a highlighting tile at aPoint if present"

	anIndex ifNil: [^ nil].
	
	^ self tileMatrixStackHighlighting layer: 1 at: anIndex y at: anIndex x
]

{
	#category : #'view-conversion',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 22:58'
}
GMTETileMap >> inViewPointToAbs: aPoint [

	^ (self viewOriginInPxl - self topLeft) + (aPoint / self viewScaleFactor) 
]

{
	#category : #'view-conversion',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/11/2024 00:01'
}
GMTETileMap >> inViewPointToViewCenter: aPoint [

	^ (self inViewPointToViewFraction: aPoint) - (self view extent / 2)
]

{
	#category : #'view-conversion',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 22:30'
}
GMTETileMap >> inViewPointToViewFraction: aPoint [

	^ self absPointToViewFraction: (self inViewPointToAbs: aPoint)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 18:15'
}
GMTETileMap >> initialize [
	
	super initialize.
	self 
		color: Color lightGray;
		clipSubmorphs: true;
		forceMapSizeRatio: false;
		view: GMTEView new; 
		
		"TODO: spike solution. Size 1@1 sets quadratic base image. Generic resizing not working yet"
		"TODO: default background tiles (must not exist but practical as a visual indicator)"
		 backgroundTiles: GMTETile checkerBoardTile
	
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:56'
}
GMTETileMap >> mapGridOnly [
	"Fit background to grid and make it transparent if background generation is disabled"
	
	self 
		fitBackgroundToMap;
		color: Color transparent;
		changed
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:22'
}
GMTETileMap >> mapPaddedHeight: anObject [

	mapPaddedHeight := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:22'
}
GMTETileMap >> mapPaddedWidth: anObject [

	mapPaddedWidth := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:22'
}
GMTETileMap >> mapPadding: anObject [

	mapPadding := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:22'
}
GMTETileMap >> mapSizeHeight: anObject [

	mapSizeHeight := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:22'
}
GMTETileMap >> mapSizeWidth: anObject [

	mapSizeWidth := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:22'
}
GMTETileMap >> mapTileHeight: anObject [

	mapTileHeight := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:22'
}
GMTETileMap >> mapTileWidth: anObject [

	mapTileWidth := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:27'
}
GMTETileMap >> rescaleMap [
	"Convenience method"

	self rescaleMapWidth: self mapTileWidth height: self mapTileHeight padding: self mapPadding
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:27'
}
GMTETileMap >> rescaleMapWidth: aWidth height: aHeigth [
	"Convenience method"
	
	self rescaleMapWidth: aWidth height: aHeigth padding: self mapPadding
]

{
	#category : #updating,
	#'squeak_changestamp' : 'jj 6/24/2024 11:05'
}
GMTETileMap >> rescaleMapWidth: aWidth height: aHeigth padding: aPadding [
	"Rescale map & trigger update"
	
	"Warning: If padding is to small relative to map, divisions by zero can occur"
	| sizeChanged |
	sizeChanged := (aWidth ~= self mapTileWidth) or: [aHeigth ~= self mapTileHeight].

	self setDimensionsWidth: aWidth height: aHeigth padding: aPadding.
	sizeChanged ifTrue: [self rescaleMatrixStacks].
	self updateMap
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:55'
}
GMTETileMap >> rescaleMatrixStacks [
	"Rescale matrix stacks to apply new dimensions"

	self tileMatrixStack ifNotNil: [
		self tileMatrixStack rescaleToWidth: self mapTileWidth height: self mapTileHeight].
		"Rescaling returns a copy of the original tiles, which must be added as submorphs again. TODO: move responsibility to Stack?"
		self tileMatrixStack doTiles: [:tile |
			self addMorph: tile].
	self tileMatrixStackHighlighting ifNotNil: [
		self tileMatrixStackHighlighting 
			rescaleToWidth: self mapTileWidth height: self mapTileHeight;
			reset.
		self generateHighlightingTiles]
]

{
	#category : #view,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 18:47'
}
GMTETileMap >> resetView [

	self view reset.
	self updateMap
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:11'
}
GMTETileMap >> revertCorrectedTilePosition: aPoint startingOffset: anOffset [
	"Revert a tile position correction"

	^ aPoint - anOffset - self topLeft	
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:12'
}
GMTETileMap >> revertCorrectedTilePositionBackground: aPoint [
	"Inversion of correction"

	^ self revertCorrectedTilePosition: aPoint startingOffset: self tileMatrixStackBackground
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:12'
}
GMTETileMap >> revertCorrectedTilePositionMap: aPoint [
	"Inversion of correction"

	^ self revertCorrectedTilePosition: aPoint startingOffset: self tileCornerOffsetMap
]

{
	#category : #'view-conversion',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 20:49'
}
GMTETileMap >> revertViewCorrectedTilePosition: aPoint [
	"comment stating purpose of message"

	^ (aPoint - self topLeft) / self viewScaleFactor + self viewOriginInPxl
]

{
	#category : #'view-conversion',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 20:47'
}
GMTETileMap >> revertViewCorrectedTilePositionMap: aPoint [
	"comment stating purpose of message"

	^ self revertCorrectedTilePositionMap: (self revertViewCorrectedTilePosition: aPoint)
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
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:19'
}
GMTETileMap >> showHighlightingLayer [
	"Shows / hides the grid"

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
	#'squeak_changestamp' : 'TW 6/22/2024 01:23'
}
GMTETileMap >> tileCornerOffsetBackground: anObject [

	tileCornerOffsetBackground := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:23'
}
GMTETileMap >> tileCornerOffsetMap: anObject [

	tileCornerOffsetMap := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 22:38'
}
GMTETileMap >> tileFromPosition: aPoint layer: aLayer [

	| index |
	index := self tileIndexFromPosition: aPoint.
	index ifNil: [^ nil].
	
	^ self tileMatrixStack layer: aLayer at: index y at: index x
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:23'
}
GMTETileMap >> tileHeight: anObject [

	tileHeight := anObject
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 20:47'
}
GMTETileMap >> tileIndexFromPosition: aPoint [
	"Answer the sender with a tile index (matrix[index x y][index x]) from a pixel position"

	| uncorrectedPos index |
	uncorrectedPos := self revertViewCorrectedTilePositionMap: aPoint.

	index := (uncorrectedPos x / self tileSizeWidth + 1) @ (uncorrectedPos y / self tileSizeHeight + 1).
	index := index floor.
	
	((self tileMatrixStackHighlighting layer: 1) validIndex: index) ifFalse: [^ nil].
	^ index
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:23'
}
GMTETileMap >> tileMatrixStack: anObject [

	tileMatrixStack := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:23'
}
GMTETileMap >> tileMatrixStackBackground: anObject [

	tileMatrixStackBackground := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/27/2024 22:20'
}
GMTETileMap >> tileMatrixStackHighlighting [

	^ tileMatrixStackHighlighting
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TW 6/22/2024 01:23'
}
GMTETileMap >> tileMatrixStackHighlighting: anObject [

	tileMatrixStackHighlighting := anObject
]

{
	#category : #conversion,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:15'
}
GMTETileMap >> tilePosFromVirtual: aPoint [
	"Answer the sender with a pixel position from a tile position (matrix[position y][position x])"

	^ (aPoint x - 1 * self tileSizeWidth) @ (aPoint y - 1 * self tileSizeHeight)
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:23'
}
GMTETileMap >> tileSizeHeight: anObject [

	tileSizeHeight := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:23'
}
GMTETileMap >> tileSizeRatio: anObject [

	tileSizeRatio := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:24'
}
GMTETileMap >> tileSizeWidth: anObject [

	tileSizeWidth := anObject
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
	#'squeak_changestamp' : 'TW 6/22/2024 01:24'
}
GMTETileMap >> tileWidth: anObject [

	tileWidth := anObject
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:19'
}
GMTETileMap >> toForeground [
	"Ensures that the tilemap morph is drawn in front oft the squeak UI"	

	self morphicLayerNumber: GMTETileMap foregroundMorphicLayerNumber
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:20'
}
GMTETileMap >> toFullScreen [
	"Automatically rescales your tilemap to fill out the screen"

	self extent: Display extent.
	self position: 0 @ 0
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:21'
}
GMTETileMap >> toFullScreenMode [
	"Scale to fullscreen & bring to foreground & make not draggable"
	
	self toForeground.
	self toFullScreen.
	self lock
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 18:00'
}
GMTETileMap >> toggleBackgroundLayer [
	"Toggles the dynamic filling of the maps background with the background tile"

	self tileMatrixStackBackground toggleVisibility.
	self updateTilesBackground.
	self changed
]

{
	#category : #'dev-api',
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:21'
}
GMTETileMap >> toggleHighlightingLayer [
	"Toggles the visibility of the grid"

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
		(self mapSizeWidth - self width // 2 negated) @ (self mapSizeHeight - self height // 2 negated).
	self tileCornerOffsetBackground:
		(self fullGridSizeWidth - self width // 2 negated) @ (self fullGridSizeHeight - self height // 2 negated)
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:28'
}
GMTETileMap >> updateMap [
	"Update map by: fitting grid to current screen, generating tile matrix, adding sprites"
	
	self dimensionsSet ifFalse: [^ nil].
	
	self updateDimensions.
	self tileMatrixStack 
		ifNil: [self generateMatrixStacks]
		ifNotNil: [self updateTiles]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 6/24/2024 11:29'
}
GMTETileMap >> updateTileMatrixStack: aStack [
	"Convenience method for editable & highlighting matrix stack"

	self updateTileMatrixStack: aStack posCorrectionBlock: [:aPoint | 
		self correctedTilePositionMap: aPoint]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 20:41'
}
GMTETileMap >> updateTileMatrixStack: aStack posCorrectionBlock: aBlock [
	"Update matrix stacks by applying new dimensions & positions"

	| tilePos correctedTilePos tileExtent tile |
	aStack doTilesXYLindex: [:x :y :l | 
		tile := aStack layer: l at: y at: x.
		
		tile ifNotNil: [
			tilePos := self tilePosFromVirtual: x@y.
			correctedTilePos := self viewCorrectedTilePosition: (aBlock value: tilePos).
			tileExtent := self viewCorrectedTileExtent: self tileSizeWidth @ self tileSizeHeight.
			tile 
				position: correctedTilePos;
				extent: tileExtent]]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 17:54'
}
GMTETileMap >> updateTiles [
	"Collectively update all matrix stacks and therefore all tiles contained within"

	"Background also has to rescale"
	"TODO: This should be refactored"
	"TODO: Rescaling is not very performant"
	
	self 
		updateTilesBackground;
		updateTileMatrixStack: self tileMatrixStack;
		updateTileMatrixStack: self tileMatrixStackHighlighting
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 17:58'
}
GMTETileMap >> updateTilesBackground [
	"Background tiles are handled seperately, because they are only updated if they're visible for performance reasons"
	
	(self tileMatrixStackBackground visible not) ifTrue: [^ nil].

	self tileMatrixStackBackground 
		rescaleToWidth: self tileWidth height: self tileHeight;
		reset. 
	self generateBackgroundTiles.
	self updateTileMatrixStack: self tileMatrixStackBackground posCorrectionBlock: [:aPoint | 
		self correctedTilePositionBackground: aPoint]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 19:31'
}
GMTETileMap >> view [

	^ view
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 19:31'
}
GMTETileMap >> view: anObject [

	view := anObject.
]

{
	#category : #'view-conversion',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 20:36'
}
GMTETileMap >> viewCorrectedTileExtent: anExtent [
	"comment stating purpose of message"

	^self viewScaleFactor * anExtent
]

{
	#category : #'view-conversion',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 20:36'
}
GMTETileMap >> viewCorrectedTilePosition: aPoint [
	"comment stating purpose of message"

	^ self viewScaleFactor * (aPoint - self viewOriginInPxl) + self topLeft
]

{
	#category : #'view-conversion',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 17:50'
}
GMTETileMap >> viewOriginInPxl [
	"Note: given that view has same ratio as tileMap"
	
	^ self extent * self view origin + self topLeft
]

{
	#category : #'view-conversion',
	#'squeak_changestamp' : 'Ivo Zilkenat 7/10/2024 17:50'
}
GMTETileMap >> viewScaleFactor [
	"Note: given that view has same ratio as tileMap"
	
	^ 1 / (self view extent x)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/2/2024 17:37'
}
GMTETileMap >> vigenerateBackgroundTiles [
	"Fill the background matrix stack with tiles automatically"
	
	self backgroundTiles ifNil: [^ nil].
	
	self tileMatrixStackBackground doTilesXYLindex: [:x :y :l | 
		"It is assumed that the background stack consists of only one layer"
		self generateTileAtlayer: l x: x y: y stack: self tileMatrixStackBackground tileType: GMTETile posCorrectionBlock: [:aPoint |
			self correctedTilePositionBackground: aPoint]].
	
	self tileMatrixStackBackground doTiles: [:tile |
		tile applyTileSprite: self backgroundTiles]
	
	
]

{
	#category : #view,
	#'squeak_changestamp' : 'Ivo Zilkenat 7/11/2024 00:33'
}
GMTETileMap >> zoomInAt: aPoint [

	self view shrinkBy: 0.1.
	self centerViewAt: aPoint
]

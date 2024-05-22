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
		'gridTileMatrix'
	],
	#category : #'GM-TE-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 16:34'
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
	#category : #updating,
	#'squeak_changestamp' : 'Valentin Teutschbein 5/20/2024 20:30'
}
GMTETileMap >> clearTiles [

	self gridTileMatrix do: [:aTile | aTile delete]
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
	#category : #'import/export',
	#'squeak_changestamp' : 'Ivo Zilkenat 5/20/2024 20:54'
}
GMTETileMap >> exportAsImage [
	"Add further options in the future like choosing file format?"
	
	self exportAsPNG
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Valentin Teutschbein 5/20/2024 20:10'
}
GMTETileMap >> extent: aPoint [

	self gridTileMatrix ifNotNil: [self rescaleMap].
	super extent: aPoint.
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
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 20:18'
}
GMTETileMap >> generateTiles [
	"Create grid tile matrix datastructure"
	
	| tilePos correctedTilePos newTile |
		
	1 to: self tileHeight do: [:y |
		1 to: self tileWidth do: [:x |
			
			tilePos := self tilePosFromVirtual: x@y.
			correctedTilePos := self correctedTilePosition: tilePos.
						
			newTile := GMTETile 
				position: correctedTilePos
				extent: self tileSizeWidth@self tileSizeHeight.
			newTile lock.
			newTile beTransparent.
			
			self addMorphFrontInLayer: newTile.
			self gridTileMatrix at: y at: x put: newTile]].

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> gridTileMatrix [

	^ gridTileMatrix
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:57'
}
GMTETileMap >> gridTileMatrix: anObject [

	gridTileMatrix := anObject.
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TW 5/22/2024 15:48'
}
GMTETileMap >> initialize [
	
	super initialize.
	self color: Color lightGray.
	
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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 21:20'
}
GMTETileMap >> processTiles [
	"comment stating purpose of message"

	self gridTileMatrix do: [ :tile | 
		tile borderColor: Color white.
		tile color: Color veryLightGray. 
		tile borderWidth: 2]

]

{
	#category : #updating,
	#'squeak_changestamp' : 'Valentin Teutschbein 5/20/2024 20:30'
}
GMTETileMap >> rescaleMap [

	self rescaleMapWidth: self tileWidth height: self tileHeight padding: self mapPadding
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/20/2024 21:19'
}
GMTETileMap >> rescaleMapWidth: aWidth height: aHeigth padding: aPadding [
	"Rescale map & trigger update"
	
	"Warning: If padding is to small relative to map, divisions by zero can occur"

	self setDimensionsWidth: aWidth height: aHeigth padding: aPadding.
	self updateMap
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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/19/2024 15:59'
}
GMTETileMap >> setDimensionsWidth: aWidth height: aHeigth padding: aPadding [
	"Set dimensions (defines what is considered as part of 'dimenisions')"

	self
		mapTileWidth: aWidth;
		mapTileHeight: aHeigth;
		mapPadding: aPadding
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 5/22/2024 19:37'
}
GMTETileMap >> stepTime [
	^1
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
	#'squeak_changestamp' : 'TW 5/22/2024 18:42'
}
GMTETileMap >> tileFromPosition: aPoint [

	| idx |
	
	idx := self tileIdxFromPosition: aPoint.
	idx ifNil: [^nil].
	
	"Transcript show: idx; cr."
	
	^ self gridTileMatrix at: idx y at: idx x.
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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 20:55'
}
GMTETileMap >> tileIdxFromPosition: aPoint [

	| uncorrectedPos idx |
	
	uncorrectedPos := self revertCorrectedTilePosition: aPoint.
	idx := (uncorrectedPos x / self tileSizeWidth + 1)@(uncorrectedPos y / self tileSizeHeight + 1).
	idx := idx floor.
	
	(self gridTileMatrix validIdx: idx) ifFalse: [^nil].
	^idx.
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
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 19:46'
}
GMTETileMap >> updateMap [
	"Update map by: fitting grid to current screen, generating tile matrix, adding sprites"

	self updateDimensions.
	self gridTileMatrix 
		ifNil: [
			self gridTileMatrix: (GMTEStaticCoordinateMatrix rows: self tileHeight columns: self tileWidth).
			self generateTiles]
		ifNotNil: [self updateTiles].
	self processTiles
]

{
	#category : #updating,
	#'squeak_changestamp' : 'Ivo Zilkenat 5/21/2024 20:18'
}
GMTETileMap >> updateTiles [

	| tilePos correctedTilePos tile |
	
	1 to: self tileHeight do: [:y |
		1 to: self tileWidth do: [:x |
			
			tilePos := self tilePosFromVirtual: x@y.
			correctedTilePos := self correctedTilePosition: tilePos.
			tile := self gridTileMatrix at: y at: x.
			
			tile 
				position: correctedTilePos;
				extent: self tileSizeWidth@self tileSizeHeight.]]
]

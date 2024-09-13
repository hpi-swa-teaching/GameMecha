accessing
extent: aPoint
	"Override extent to properly scale tile map"

	| oldExtent newExtent |
	self forceMapSizeRatio
		ifTrue: [newExtent := (aPoint x) @ (aPoint x * (self mapTileHeight / self mapTileWidth))]
		ifFalse: [newExtent := aPoint].
		
	oldExtent := self extent.

	super extent: newExtent.
	
	(oldExtent = newExtent) ifTrue: [^ nil].
	self tileMatrixStack ifNotNil: [self rescaleMap]
	
	
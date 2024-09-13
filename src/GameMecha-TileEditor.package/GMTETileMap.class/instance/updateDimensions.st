updating
updateDimensions
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
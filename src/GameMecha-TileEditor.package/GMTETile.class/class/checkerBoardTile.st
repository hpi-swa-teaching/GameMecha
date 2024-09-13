instance creation
checkerBoardTile
	"Returns a tile with a checkboard pattern"
	
	| checkerboardPatternForm |
	
	checkerboardPatternForm := Form extent: 2 @ 2 depth: 32.
	self checkerBoardColors keysDo: [:offset | 
	checkerboardPatternForm colorAt: offset put: (self checkerBoardColors at: offset)].
	
	^ self fromSprite: checkerboardPatternForm
accessing
tileFromPosition: aPoint layer: aLayer

	| index |
	index := self tileIndexFromPosition: aPoint.
	index ifNil: [^ nil].
	
	^ self tileMatrixStack layer: aLayer at: index y at: index x
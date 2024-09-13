execute
executeWithIndex: anIndex andLayer: aLayer

	anIndex ifNil: [^ nil].
	self currentMatrixIndex: anIndex.
	self layer: aLayer.
	^ self currentBrush value